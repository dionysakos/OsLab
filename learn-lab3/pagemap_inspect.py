#!/usr/bin/env python3
import argparse
import os
import struct
from typing import Optional, Tuple

PAGE_IS_PRESENT = 1 << 63
PAGE_IS_SWAPPED = 1 << 62
PAGE_IS_FILE = 1 << 61
PAGE_SOFT_DIRTY = 1 << 55
PAGE_EXCLUSIVE = 1 << 56
PAGE_UFFD_WP = 1 << 57
PAGE_GUARD = 1 << 58
PFN_MASK = (1 << 55) - 1

KPAGEFLAGS = {
    0: 'LOCKED', 1: 'ERROR', 2: 'REFERENCED', 3: 'UPTODATE', 4: 'DIRTY',
    5: 'LRU', 6: 'ACTIVE', 7: 'SLAB', 8: 'WRITEBACK', 9: 'RECLAIM',
    10: 'BUDDY', 11: 'MMAP', 12: 'ANON', 13: 'SWAPCACHE', 14: 'SWAPBACKED',
    15: 'COMPOUND_HEAD', 16: 'COMPOUND_TAIL', 17: 'HUGE', 18: 'UNEVICTABLE',
    19: 'HWPOISON', 20: 'NOPAGE', 21: 'KSM', 22: 'THP', 23: 'OFFLINE',
    24: 'ZERO_PAGE', 25: 'IDLE', 26: 'PGTABLE'
}


def find_vma(pid: int, addr: int) -> Optional[str]:
    with open(f'/proc/{pid}/maps', 'r', encoding='utf-8') as f:
        for line in f:
            rng = line.split()[0]
            start_s, end_s = rng.split('-')
            start, end = int(start_s, 16), int(end_s, 16)
            if start <= addr < end:
                return line.rstrip()
    return None


def read_u64(path: str, index: int) -> int:
    with open(path, 'rb') as f:
        f.seek(index * 8)
        data = f.read(8)
        if len(data) != 8:
            raise RuntimeError('short read')
        return struct.unpack('Q', data)[0]


def decode_pagemap(entry: int) -> Tuple[dict, str]:
    info = {
        'raw': f'0x{entry:016x}',
        'present': bool(entry & PAGE_IS_PRESENT),
        'swapped': bool(entry & PAGE_IS_SWAPPED),
        'file_or_shared_anon': bool(entry & PAGE_IS_FILE),
        'soft_dirty': bool(entry & PAGE_SOFT_DIRTY),
        'exclusive': bool(entry & PAGE_EXCLUSIVE),
        'uffd_wp': bool(entry & PAGE_UFFD_WP),
        'guard': bool(entry & PAGE_GUARD),
    }
    state = 'unmapped'
    if info['present']:
        pfn = entry & PFN_MASK
        info['pfn'] = pfn
        state = 'present'
    elif info['swapped']:
        swap_type = entry & 0x1F
        swap_offset = (entry >> 5) & ((1 << 50) - 1)
        info['swap_type'] = swap_type
        info['swap_offset'] = swap_offset
        state = 'swapped'
    return info, state


def read_kpageflags(pfn: int) -> list:
    entry = read_u64('/proc/kpageflags', pfn)
    return [name for bit, name in KPAGEFLAGS.items() if entry & (1 << bit)]


def read_kpagecount(pfn: int) -> int:
    return read_u64('/proc/kpagecount', pfn)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument('pid', type=int)
    ap.add_argument('vaddr', help='virtual address, e.g. 0x7f...')
    args = ap.parse_args()

    addr = int(args.vaddr, 0)
    pagesz = os.sysconf('SC_PAGESIZE')
    vpn = addr // pagesz
    vma = find_vma(args.pid, addr)
    if not vma:
        raise SystemExit('address is not inside any VMA from /proc/<pid>/maps')

    entry = read_u64(f'/proc/{args.pid}/pagemap', vpn)
    info, state = decode_pagemap(entry)

    print(f'pid={args.pid}')
    print(f'vaddr=0x{addr:x}')
    print(f'page_size={pagesz}')
    print(f'vma={vma}')
    print(f'pagemap_raw={info["raw"]}')
    print(f'state={state}')
    for key in ['present', 'swapped', 'file_or_shared_anon', 'soft_dirty', 'exclusive', 'uffd_wp', 'guard']:
        print(f'{key}={int(info[key])}')

    if state == 'present':
        print(f'pfn={info["pfn"]}')
        try:
            flags = read_kpageflags(info['pfn'])
            count = read_kpagecount(info['pfn'])
            print('kpagecount=' + str(count))
            print('kpageflags=' + ','.join(flags))
        except PermissionError:
            print('kpageflags=permission-denied')
    elif state == 'swapped':
        print(f'swap_type={info["swap_type"]}')
        print(f'swap_offset={info["swap_offset"]}')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
