#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int create_mask(int from, int to);
void print_binary(int value, int BIT_WORD_SIZE);

int main()
{
    /* Default values */
    int virtual_address = 0x150A;  // Virtual adrese
    int page_size = 32;            // block size
    int virtual_adresse_bits = 14; // Virtual addresse i bits
    int fysisk_addresse_bits = 12; // Fysisk addresse i bits
    int tlb_sets = 4;              // Antal sets

    printf("What is the virtual address? Type it without 0x => ");
    scanf("%x", &virtual_address);

    printf("How many bytes is the page size? => ");
    scanf("%d", &page_size);

    printf("How many bits is the virtual address? => ");
    scanf("%d", &virtual_adresse_bits);

    printf("How many bits is the physical address? => ");
    scanf("%d", &fysisk_addresse_bits);

    printf("How many TBL sets? => ");
    scanf("%d", &tlb_sets);

    const int vpo_bits = log2(page_size);
    const int tlb_index_bits = log2(tlb_sets);
    const int tlb_tag_bits = virtual_adresse_bits - (vpo_bits + tlb_index_bits);

    int vpo_mask = create_mask(0, vpo_bits);
    int vpn_mask = create_mask(vpo_bits, vpo_bits + tlb_index_bits + tlb_tag_bits);
    int tlb_index_mask = create_mask(vpo_bits, vpo_bits + tlb_index_bits);
    int tlb_tag_mask = create_mask(vpo_bits + tlb_index_bits, vpo_bits + tlb_index_bits + tlb_tag_bits);

    int VPN = (virtual_address & vpn_mask) >> vpo_bits;
    int VPO_OFFSET = virtual_address & vpo_mask;
    int TLB_INDEX = (virtual_address & tlb_index_mask) >> vpo_bits;
    int TLB_TAG = (virtual_address & tlb_tag_mask) >> (tlb_index_bits + vpo_bits);

    printf("Virtual address in bits: ");
    print_binary(virtual_address, virtual_adresse_bits);
    printf("\n");

    printf("VPN: %x\n", VPN);                   // VPN
    printf("TLB-INDEX (SET): %x\n", TLB_INDEX); // TLB-INDEX
    printf("TLB-TAG: %x\n", TLB_TAG);           // TLB TAG
    printf("VPO OFFSET: %x\n", VPO_OFFSET);     // Også kaldet offset

    int tlb_miss;
    int ppn;
    int tlb_hit;
    int no_pagefault = 0;

    printf("TBL TABLE: Index (set) %x, tag %x. Match and valid? ", TLB_INDEX, TLB_TAG);
    scanf("%d", &tlb_hit);

    if (!tlb_hit)
    {
        printf("Pagetable: VPN %x. Match and valid? ", VPN);
        scanf("%d", &no_pagefault);
    }

    if (tlb_hit || no_pagefault)
    {
        printf("What is PPN at VPN %x? ", VPN);
        scanf("%x", &ppn);
    }

    printf("TLB Hit? %s\n", tlb_hit ? "Yes" : "No");
    printf("Page fault? %s\n", no_pagefault ? "No" : "Yes");
    printf("PPN is: ");
    if (ppn)
    {
        printf("%x\n", ppn);

        printf("Bits in physical address: ");

        ppn <<= vpo_bits;
        int result = ppn | VPO_OFFSET;

        print_binary(result, fysisk_addresse_bits);
        printf("\n");
    }
    else
    {
        printf("-\n");

        for (int i = 0; i < fysisk_addresse_bits; i++)
        {
            printf("-");
        }
        printf("\n");
    }
    return 1;
}

int create_mask(int from, int to)
{
    int mask = 0;
    for (int i = from; i < to; i++)
    {
        mask |= (1 << i);
    }
    return mask;
}

void print_binary(int value, int size)
{
    if (size == 0)
        return;

    print_binary(value / 2, --size);

    printf("%d", value % 2);
}