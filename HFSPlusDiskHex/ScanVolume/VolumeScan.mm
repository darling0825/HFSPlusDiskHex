//
//  VolumeScan.cpp
//  HFSPlusDiskHex
//
//  Created by Peng Pagict on 13-6-1.
//  Copyright (c) 2013年 pagict. All rights reserved.
//
#include "../DiskRead.h"
#include "VolumeScan.h"

int getVolumeHeader(FILE* p_file,unsigned long startOffset, HFSPlusVolumeHeader* p_volumeHeader)
{
    /*** Test if the devicefd is valid ***/
    if (!p_file) {
        return -1;
    }
    
    /*** set the pointer position, skip reversed blocks ***/
    fseek(p_file, startOffset*BLOCKSIZE, SEEK_SET);
    fseek(p_file, 1024, SEEK_CUR);
    
    /*** read volume header data, assign structure values ***/
   size_t cnt = fread(p_volumeHeader, sizeof(HFSPlusVolumeHeader), 1, p_file);
    
    if (!cnt) {
        return -1;
    }
    
    return (int)cnt;
}