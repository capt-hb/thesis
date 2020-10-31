169a170,187
> // Uninit Store capabilities
> class CheriFmtUCS<bits<6> op, dag outs, dag ins, string asmstr,
>                 list<dag> pattern> :
>   MipsInst<outs, ins, asmstr, pattern, NoItinerary, FrmOther>, Sched<[]>
> {
>   bits<5>  cd;
>   bits<5>  cs;
>   bits<5>  cb;
>   bits<11> offset;
> 
>   let Opcode = op;
>   let Inst{25-21} = cd;
>   let Inst{20-16} = cs;
>   let Inst{15-11} = cb;
>   let Inst{10-0}  = offset;
>   let hasSideEffects = 0;
> }
> 
201a220,238
> }
> 
> class CheriFmtUCSX<bits<2> t, bits<1> e, dag outs, dag ins, string asmstr,
>                 list<dag> pattern> :
>   MipsInst<outs, ins, asmstr, pattern, NoItinerary, FrmOther>, Sched<[]>
> {
>   bits<5>  cd;
>   bits<5>  rs;
>   bits<5>  cb;
>   bits<8>  offset;
> 
>   let Opcode = 0x3b;
>   let Inst{25-21} = cd;
>   let Inst{20-16} = rs;
>   let Inst{15-11} = cb;
>   let Inst{10-3}  = offset;
>   let Inst{2}     = e;
>   let Inst{1-0}   = t;
>   let hasSideEffects = 1;
