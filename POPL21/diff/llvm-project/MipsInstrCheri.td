271a272,273
> def CGetUninit : CheriFmtCGet<0x15, "uninit">;
> 
278a281,282
>   def CShrinkImm : CheriFmtCSetImm<0x17, uimm11s0, "cshrink",
>     [(set CheriOpnd:$cd, (int_cheri_cap_shrink CheriOpnd:$cb, (i64 uimm11s0Pattern: $imm)))]>;
287a292,293
> def : InstAlias<"cshrinkimm $dst, $src, $imm",
>                 (CShrinkImm CheriOpnd:$dst, CheriOpnd:$src, simm11s0:$imm), 0>;
291a298,299
> def : InstAlias<"cshrinkimm $dst, $imm",
>                 (CShrinkImm CheriOpnd:$dst, CheriOpnd:$dst, simm11s0:$imm), 0>;
312a321,332
> def CUninit  : CheriFmt2Op<0x1b, (outs CheriOpnd:$r1), (ins CheriOpnd:$r2),
>                               "cuninit\t$r1, $r2",
>                               [(set CheriOpnd:$r1, (int_cheri_cap_uninit CheriOpnd:$r2))]>;
> 
> def CDropUninit  : CheriFmt2Op<0x1c, (outs CheriOpnd:$r1), (ins CheriOpnd:$r2),
>                               "cdropuninit\t$r1, $r2",
>                               [(set CheriOpnd:$r1, (int_cheri_cap_drop_uninit CheriOpnd:$r2))]>;
> 
> def CShrink  : CheriFmt3Op<0x2c, (outs CheriOpnd:$r1), (ins CheriOpnd:$r2, GPR64Opnd:$r3),
>                               "cshrink\t$r1, $r2, $r3",
>                               [(set CheriOpnd:$r1, (int_cheri_cap_shrink CheriOpnd:$r2, GPR64Opnd:$r3))]>;
> 
486a507,511
> 
> def UNINITSTORECAP : CheriFmtUCS<0x3d, (outs CheriOpnd:$ct), (ins CheriOpnd:$cs, simm8:$offset, CheriOpnd:$cb),
>                          "ucsc\t$ct, $cs, ${offset}(${cb})",
>                          [(set CheriOpnd:$ct, (store CheriOpnd:$cs, (add (ptrtoint CheriOpnd:$cb), (i64 simm8Pattern:$offset))))]>;
> 
499a525,527
> def : Pat<(store CheriOpnd:$cs, CheriOpnd:$cb),
>           (UNINITSTORECAP CheriOpnd:$cs, (i64 0), CheriOpnd:$cb)>;
> 
550a579,588
> multiclass UStoreViaCapScaled<bits<2> t, bit e, string instr_asm, RegisterOperand RC, PatFrag storeType, Operand simm, PatFrag immfrag> {
>   def #NAME# : CheriFmtUCSX<t, e,
>                              (outs CheriOpnd:$cd),
>                              (ins RC:$rs, simm:$offset, CheriOpnd0IsDDC:$cb),
>                              !strconcat(instr_asm, "\t$cd, ${rs}, ${offset}(${cb})"),
>                            [(set CheriOpnd:$cd, (storeType (CapRegType (ptradd CheriOpnd0IsDDC:$cb, (i64 immfrag:$offset))), RC:$rs))]>;
> }
> multiclass UStoreViaCap<bits<2> t, bit e, string instr_asm, RegisterOperand RC, PatFrag storeType> :
>   UStoreViaCapScaled<t, e, instr_asm, RC, storeType, simm8, immSExt8>;
> 
600a639,648
> 
> defm UCAPSTORE8      : UStoreViaCap<0, 0, "ucsb", GPR64Opnd, truncstorei8>;
> defm UCAPSTORE16     : UStoreViaCap<1, 0, "ucsh", GPR64Opnd, truncstorei16>;
> defm UCAPSTORE32     : UStoreViaCap<2, 0, "ucsw", GPR32Opnd, store>;
> let isCodeGenOnly=1 in {
>   defm UCAPSTORE832      : UStoreViaCap<0, 0, "ucsb", GPR32Opnd, truncstorei8>;
>   defm UCAPSTORE1632     : UStoreViaCap<1, 0, "ucsh", GPR32Opnd, truncstorei16>;
>   defm UCAPSTORE3264     : UStoreViaCap<2, 0, "ucsw", GPR64Opnd, truncstorei32>;
> }
> defm UCAPSTORE64     : UStoreViaCap<3, 0, "ucsd", GPR64Opnd, store>;
