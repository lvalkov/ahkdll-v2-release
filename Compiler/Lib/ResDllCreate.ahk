﻿ResDllCreate(path) {
static Trg
if !hex
  VarSetCapacity(Trg,112,0),hex:="504B0304A443DDC85C0000000004000000000000F38D62201B1C60187810E0CAC0E0C3C8C8F0BF9F65374CEC01039F2237233B1798C384A458008A19182134508E052A05A31914107A98C1C22C503D02501A4EA102011CE234027A45C545C90C08A781DDCC84AAC6018C46C128C00D00"
LoopParse,%hex%
If Mod(A_Index,2),h:=A_LoopField
else NumPut("0x" h A_LoopField,Trg,A_Index/2-1,"UChar")
UnZipRawMemory(&Trg,112,data)
If 0<hF:=CreateFile(path,0x40000000,2,0,2)
WriteFile(hF,&data,1024,&init,0),CloseHandle(hF)
return FileGetSize(path)=1024
}