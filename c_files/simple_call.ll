; ModuleID = 'simple_call.c'
source_filename = "simple_call.c"
target datalayout = "E-m:e-pf200:128:128:128:64-i8:8:32-i16:16:32-i64:64-n32:64-S128-A200-P200-G200"
target triple = "cheri-unknown-freebsd-purecap"

; Function Attrs: noinline nounwind optnone
define signext i32 @doSomething(i32 signext %a) addrspace(200) #0 {
entry:
  %a.addr = alloca i32, align 4, addrspace(200)
  store i32 %a, i32 addrspace(200)* %a.addr, align 4
  %0 = load i32, i32 addrspace(200)* %a.addr, align 4
  ret i32 %0
}

; Function Attrs: noinline nounwind optnone
define signext i32 @main() addrspace(200) #0 {
entry:
  %retval = alloca i32, align 4, addrspace(200)
  %value = alloca i32, align 4, addrspace(200)
  store i32 0, i32 addrspace(200)* %retval, align 4
  %call = call signext i32 @doSomething(i32 signext 100)
  store i32 %call, i32 addrspace(200)* %value, align 4
  %0 = load i32, i32 addrspace(200)* %value, align 4
  ret i32 %0
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="beri" "target-features"="+beri,+cheri128,+chericap,-noabicalls" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{!"clang version 9.0.0 (git@github.com:capt-hb/llvm-project.git 39c89f7d086070b149443c4bd3ca31c30ba14c97)"}
