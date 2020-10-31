13a14,17
> def int_cheri_cap_shrink:
>   Intrinsic<[llvm_fatptr_ty],
>             [llvm_fatptr_ty, llvm_anyint_ty],
>             [IntrNoMem, IntrWillReturn]>;
14a19,30
> def int_cheri_cap_uninit_get :
>   Intrinsic<[llvm_anyint_ty],
>             [llvm_fatptr_ty],
>             [IntrNoMem, IntrWillReturn]>;
> def int_cheri_cap_uninit :
>   Intrinsic<[llvm_fatptr_ty],
>             [llvm_fatptr_ty],
>             [IntrNoMem, IntrWillReturn]>;
> def int_cheri_cap_drop_uninit :
>   Intrinsic<[llvm_fatptr_ty],
>             [llvm_fatptr_ty],
>             [IntrNoMem, IntrWillReturn]>;
