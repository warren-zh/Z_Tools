; ModuleID = 'autocfg_0a2167df6a60be2b_1.2ef79622e95c7e39-cgu.0'
source_filename = "autocfg_0a2167df6a60be2b_1.2ef79622e95c7e39-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"core::fmt::rt::Argument<'_>" = type { %"core::fmt::rt::ArgumentType<'_>" }
%"core::fmt::rt::ArgumentType<'_>" = type { ptr, [1 x i64] }

@alloc_fad0cd83b7d1858a846a172eb260e593 = private unnamed_addr constant <{ [42 x i8] }> <{ [42 x i8] c"is_aligned_to: align is not a power-of-two" }>, align 1
@alloc_e92e94d0ff530782b571cfd99ec66aef = private unnamed_addr constant <{ ptr, [8 x i8] }> <{ ptr @alloc_fad0cd83b7d1858a846a172eb260e593, [8 x i8] c"*\00\00\00\00\00\00\00" }>, align 8
@0 = private unnamed_addr constant <{ [8 x i8], [8 x i8] }> <{ [8 x i8] zeroinitializer, [8 x i8] undef }>, align 8
@alloc_63bbee50704d43a1a9ec742deebdf522 = private unnamed_addr constant <{ [81 x i8] }> <{ [81 x i8] c"/rustc/4eb161250e340c8f48f66e2b929ef4a5bed7c181/library/core/src/ptr/const_ptr.rs" }>, align 1
@alloc_68990143625ec2db4c689f394fa1b298 = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc_63bbee50704d43a1a9ec742deebdf522, [16 x i8] c"Q\00\00\00\00\00\00\00\C8\05\00\00\0D\00\00\00" }>, align 8
@alloc_8df0580a595a87d56789d20c7318e185 = private unnamed_addr constant <{ [166 x i8] }> <{ [166 x i8] c"unsafe precondition(s) violated: ptr::copy_nonoverlapping requires that both pointer arguments are aligned and non-null and the specified memory ranges do not overlap" }>, align 1
@alloc_ab14703751a9eb3585c49b2e55e9a9e5 = private unnamed_addr constant <{ [104 x i8] }> <{ [104 x i8] c"unsafe precondition(s) violated: hint::assert_unchecked must never be called when the condition is false" }>, align 1
@alloc_763310d78c99c2c1ad3f8a9821e942f3 = private unnamed_addr constant <{ [61 x i8] }> <{ [61 x i8] c"is_nonoverlapping: `size_of::<T>() * count` overflows a usize" }>, align 1
@alloc_04f05a5b5adec86fe5a98705c512ab60 = private unnamed_addr constant <{ [74 x i8] }> <{ [74 x i8] c"/rustc/4eb161250e340c8f48f66e2b929ef4a5bed7c181/library/alloc/src/slice.rs" }>, align 1
@alloc_c44662335dc386f389cccdbca327402f = private unnamed_addr constant <{ ptr, [16 x i8] }> <{ ptr @alloc_04f05a5b5adec86fe5a98705c512ab60, [16 x i8] c"J\00\00\00\00\00\00\00\A1\00\00\00\19\00\00\00" }>, align 8
@alloc_eab5d04767146d7d9b93b60d28ef530a = private unnamed_addr constant <{ ptr, [8 x i8] }> <{ ptr inttoptr (i64 1 to ptr), [8 x i8] zeroinitializer }>, align 8
@alloc_53973d2fe29b4adba8bb7390b5678745 = private unnamed_addr constant <{ [8 x i8] }> zeroinitializer, align 8

; core::intrinsics::copy_nonoverlapping::precondition_check
; Function Attrs: inlinehint nounwind nonlazybind uwtable
define internal void @_ZN4core10intrinsics19copy_nonoverlapping18precondition_check17h0eda0ca2ad064635E(ptr %src, ptr %dst, i64 %size, i64 %align, i64 %count) unnamed_addr #0 personality ptr @rust_eh_personality {
start:
  %0 = alloca [4 x i8], align 4
  %_26 = alloca [48 x i8], align 8
  %_21 = alloca [4 x i8], align 4
  %_20 = alloca [8 x i8], align 8
  %_19 = alloca [8 x i8], align 8
  %_18 = alloca [8 x i8], align 8
  %_17 = alloca [48 x i8], align 8
  %is_zst = alloca [1 x i8], align 1
  %align1 = alloca [8 x i8], align 8
  %zero_size = alloca [1 x i8], align 1
  %1 = icmp eq i64 %count, 0
  br i1 %1, label %bb1, label %bb2

bb1:                                              ; preds = %start
  store i8 1, ptr %zero_size, align 1
  store i64 %align, ptr %align1, align 8
  %2 = load i8, ptr %zero_size, align 1
  %3 = trunc i8 %2 to i1
  %4 = zext i1 %3 to i8
  store i8 %4, ptr %is_zst, align 1
  %5 = call i64 @llvm.ctpop.i64(i64 %align)
  %6 = trunc i64 %5 to i32
  store i32 %6, ptr %_21, align 4
  %7 = load i32, ptr %_21, align 4
  %8 = icmp eq i32 %7, 1
  br i1 %8, label %bb26, label %bb15

bb2:                                              ; preds = %start
  %9 = icmp eq i64 %size, 0
  %10 = zext i1 %9 to i8
  store i8 %10, ptr %zero_size, align 1
  store i64 %align, ptr %align1, align 8
  %11 = load i8, ptr %zero_size, align 1
  %12 = trunc i8 %11 to i1
  %13 = zext i1 %12 to i8
  store i8 %13, ptr %is_zst, align 1
  %14 = call i64 @llvm.ctpop.i64(i64 %align)
  %15 = trunc i64 %14 to i32
  store i32 %15, ptr %_21, align 4
  %16 = load i32, ptr %_21, align 4
  %17 = icmp eq i32 %16, 1
  br i1 %17, label %bb14, label %bb15

bb26:                                             ; preds = %bb1
  %18 = ptrtoint ptr %src to i64
  store i64 %18, ptr %_19, align 8
  %19 = sub i64 %align, 1
  store i64 %19, ptr %_20, align 8
  %20 = load i64, ptr %_19, align 8
  %21 = load i64, ptr %_20, align 8
  %22 = and i64 %20, %21
  store i64 %22, ptr %_18, align 8
  %23 = load i64, ptr %_18, align 8
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %bb27, label %bb11

bb15:                                             ; preds = %bb2, %bb1
  store ptr @alloc_e92e94d0ff530782b571cfd99ec66aef, ptr %_17, align 8
  %25 = getelementptr inbounds i8, ptr %_17, i64 8
  store i64 1, ptr %25, align 8
  %26 = load ptr, ptr @0, align 8
  %27 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  %28 = getelementptr inbounds i8, ptr %_17, i64 32
  store ptr %26, ptr %28, align 8
  %29 = getelementptr inbounds i8, ptr %28, i64 8
  store i64 %27, ptr %29, align 8
  %30 = getelementptr inbounds i8, ptr %_17, i64 16
  store ptr inttoptr (i64 8 to ptr), ptr %30, align 8
  %31 = getelementptr inbounds i8, ptr %30, i64 8
  store i64 0, ptr %31, align 8
; invoke core::panicking::panic_fmt
  invoke void @_ZN4core9panicking9panic_fmt17hf8ffc7c15bfb58a0E(ptr align 8 %_17, ptr align 8 @alloc_68990143625ec2db4c689f394fa1b298) #11
          to label %unreachable unwind label %terminate

bb27:                                             ; preds = %bb26
  br label %bb12

bb11:                                             ; preds = %bb14, %bb26
  br label %bb6

bb12:                                             ; preds = %bb10, %bb27
  br label %bb3

bb14:                                             ; preds = %bb2
  %32 = ptrtoint ptr %src to i64
  store i64 %32, ptr %_19, align 8
  %33 = sub i64 %align, 1
  store i64 %33, ptr %_20, align 8
  %34 = load i64, ptr %_19, align 8
  %35 = load i64, ptr %_20, align 8
  %36 = and i64 %34, %35
  store i64 %36, ptr %_18, align 8
  %37 = load i64, ptr %_18, align 8
  %38 = icmp eq i64 %37, 0
  br i1 %38, label %bb10, label %bb11

bb10:                                             ; preds = %bb14
  %39 = load i8, ptr %is_zst, align 1
  %40 = trunc i8 %39 to i1
  br i1 %40, label %bb12, label %bb13

bb13:                                             ; preds = %bb10
  %41 = load i64, ptr %_19, align 8
  %_15 = icmp eq i64 %41, 0
  %_8 = xor i1 %_15, true
  br i1 %_8, label %bb3, label %bb6

bb6:                                              ; preds = %bb11, %bb13
  br label %bb7

bb3:                                              ; preds = %bb12, %bb13
  %42 = load i8, ptr %zero_size, align 1
  %is_zst2 = trunc i8 %42 to i1
  %43 = call i64 @llvm.ctpop.i64(i64 %align)
  %44 = trunc i64 %43 to i32
  store i32 %44, ptr %0, align 4
  %_29 = load i32, ptr %0, align 4
  %45 = icmp eq i32 %_29, 1
  br i1 %45, label %bb21, label %bb22

bb21:                                             ; preds = %bb3
  %_28 = ptrtoint ptr %dst to i64
  %46 = load i64, ptr %_20, align 8
  %_27 = and i64 %_28, %46
  %47 = icmp eq i64 %_27, 0
  br i1 %47, label %bb17, label %bb18

bb22:                                             ; preds = %bb3
  store ptr @alloc_e92e94d0ff530782b571cfd99ec66aef, ptr %_26, align 8
  %48 = getelementptr inbounds i8, ptr %_26, i64 8
  store i64 1, ptr %48, align 8
  %49 = load ptr, ptr @0, align 8
  %50 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  %51 = getelementptr inbounds i8, ptr %_26, i64 32
  store ptr %49, ptr %51, align 8
  %52 = getelementptr inbounds i8, ptr %51, i64 8
  store i64 %50, ptr %52, align 8
  %53 = getelementptr inbounds i8, ptr %_26, i64 16
  store ptr inttoptr (i64 8 to ptr), ptr %53, align 8
  %54 = getelementptr inbounds i8, ptr %53, i64 8
  store i64 0, ptr %54, align 8
; invoke core::panicking::panic_fmt
  invoke void @_ZN4core9panicking9panic_fmt17hf8ffc7c15bfb58a0E(ptr align 8 %_26, ptr align 8 @alloc_68990143625ec2db4c689f394fa1b298) #11
          to label %unreachable unwind label %terminate

bb17:                                             ; preds = %bb21
  br i1 %is_zst2, label %bb19, label %bb20

bb18:                                             ; preds = %bb21
  br label %bb5

bb20:                                             ; preds = %bb17
  %_24 = icmp eq i64 %_28, 0
  %_11 = xor i1 %_24, true
  br i1 %_11, label %bb4, label %bb5

bb19:                                             ; preds = %bb17
  br label %bb4

bb5:                                              ; preds = %bb18, %bb20
  br label %bb7

bb4:                                              ; preds = %bb19, %bb20
; invoke core::ub_checks::maybe_is_nonoverlapping::runtime
  %_6 = invoke zeroext i1 @_ZN4core9ub_checks23maybe_is_nonoverlapping7runtime17hd473bd1505aa107aE(ptr %src, ptr %dst, i64 %size, i64 %count)
          to label %bb24 unwind label %terminate

terminate:                                        ; preds = %bb15, %bb22, %bb4
  %55 = landingpad { ptr, i32 }
          filter [0 x ptr] zeroinitializer
  %56 = extractvalue { ptr, i32 } %55, 0
  %57 = extractvalue { ptr, i32 } %55, 1
; call core::panicking::panic_cannot_unwind
  call void @_ZN4core9panicking19panic_cannot_unwind17hf517234e476fc7c7E() #12
  unreachable

bb24:                                             ; preds = %bb4
  br i1 %_6, label %bb9, label %bb8

bb8:                                              ; preds = %bb7, %bb24
; call core::panicking::panic_nounwind
  call void @_ZN4core9panicking14panic_nounwind17h2f7749cb358aa979E(ptr align 1 @alloc_8df0580a595a87d56789d20c7318e185, i64 166) #13
  unreachable

bb9:                                              ; preds = %bb24
  ret void

bb7:                                              ; preds = %bb6, %bb5
  br label %bb8

unreachable:                                      ; preds = %bb15, %bb22
  unreachable
}

; core::intrinsics::cold_path
; Function Attrs: cold nounwind nonlazybind uwtable
define internal void @_ZN4core10intrinsics9cold_path17hc6cd064f30099082E() unnamed_addr #1 {
start:
  ret void
}

; core::fmt::rt::Argument::new_lower_exp
; Function Attrs: inlinehint nonlazybind uwtable
define void @_ZN4core3fmt2rt8Argument13new_lower_exp17h9810041a7e40fca9E(ptr sret([16 x i8]) align 8 %_0, ptr align 8 %x) unnamed_addr #2 {
start:
; call core::fmt::rt::Argument::new
  call void @_ZN4core3fmt2rt8Argument3new17h9d3cc03a8c290228E(ptr sret([16 x i8]) align 8 %_0, ptr align 8 %x, ptr @"_ZN4core3fmt3num3imp55_$LT$impl$u20$core..fmt..LowerExp$u20$for$u20$isize$GT$3fmt17h564bb40e0c4b7a67E")
  ret void
}

; core::fmt::rt::Argument::new
; Function Attrs: inlinehint nonlazybind uwtable
define void @_ZN4core3fmt2rt8Argument3new17h9d3cc03a8c290228E(ptr sret([16 x i8]) align 8 %_0, ptr align 8 %x, ptr %f) unnamed_addr #2 {
start:
  %_3 = alloca [16 x i8], align 8
  store ptr %x, ptr %_3, align 8
  %0 = getelementptr inbounds i8, ptr %_3, i64 8
  store ptr %f, ptr %0, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %_3, i64 16, i1 false)
  ret void
}

; core::fmt::Arguments::new_v1
; Function Attrs: inlinehint nonlazybind uwtable
define void @_ZN4core3fmt9Arguments6new_v117hb57f6a36d65ec6d6E(ptr sret([48 x i8]) align 8 %_0, ptr align 8 %pieces, ptr align 8 %args) unnamed_addr #2 {
start:
  store ptr %pieces, ptr %_0, align 8
  %0 = getelementptr inbounds i8, ptr %_0, i64 8
  store i64 1, ptr %0, align 8
  %1 = load ptr, ptr @0, align 8
  %2 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  %3 = getelementptr inbounds i8, ptr %_0, i64 32
  store ptr %1, ptr %3, align 8
  %4 = getelementptr inbounds i8, ptr %3, i64 8
  store i64 %2, ptr %4, align 8
  %5 = getelementptr inbounds i8, ptr %_0, i64 16
  store ptr %args, ptr %5, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 8
  store i64 1, ptr %6, align 8
  ret void
}

; core::ops::function::FnOnce::call_once
; Function Attrs: inlinehint nonlazybind uwtable
define internal void @_ZN4core3ops8function6FnOnce9call_once17h95e0cb306777874aE(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %0, i64 %1) unnamed_addr #2 {
start:
  %_2 = alloca [16 x i8], align 8
  store ptr %0, ptr %_2, align 8
  %2 = getelementptr inbounds i8, ptr %_2, i64 8
  store i64 %1, ptr %2, align 8
  %3 = load ptr, ptr %_2, align 8
  %4 = getelementptr inbounds i8, ptr %_2, i64 8
  %5 = load i64, ptr %4, align 8
; call alloc::str::<impl alloc::borrow::ToOwned for str>::to_owned
  call void @"_ZN5alloc3str56_$LT$impl$u20$alloc..borrow..ToOwned$u20$for$u20$str$GT$8to_owned17h566ec8d18e5db0baE"(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %3, i64 %5)
  ret void
}

; core::ptr::drop_in_place<alloc::string::String>
; Function Attrs: nonlazybind uwtable
define void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h04b57bf7649d4a6fE"(ptr align 8 %_1) unnamed_addr #3 {
start:
; call core::ptr::drop_in_place<alloc::vec::Vec<u8>>
  call void @"_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17heb085814485249e2E"(ptr align 8 %_1)
  ret void
}

; core::ptr::drop_in_place<alloc::vec::Vec<u8>>
; Function Attrs: nonlazybind uwtable
define void @"_ZN4core3ptr46drop_in_place$LT$alloc..vec..Vec$LT$u8$GT$$GT$17heb085814485249e2E"(ptr align 8 %_1) unnamed_addr #3 personality ptr @rust_eh_personality {
start:
  %0 = alloca [16 x i8], align 8
; invoke <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
  invoke void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8174146e575bf946E"(ptr align 8 %_1)
          to label %bb4 unwind label %cleanup

bb3:                                              ; preds = %cleanup
; invoke core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
  invoke void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17h80c7cc0eff8b52aeE"(ptr align 8 %_1) #14
          to label %bb1 unwind label %terminate

cleanup:                                          ; preds = %start
  %1 = landingpad { ptr, i32 }
          cleanup
  %2 = extractvalue { ptr, i32 } %1, 0
  %3 = extractvalue { ptr, i32 } %1, 1
  store ptr %2, ptr %0, align 8
  %4 = getelementptr inbounds i8, ptr %0, i64 8
  store i32 %3, ptr %4, align 8
  br label %bb3

bb4:                                              ; preds = %start
; call core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
  call void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17h80c7cc0eff8b52aeE"(ptr align 8 %_1)
  ret void

terminate:                                        ; preds = %bb3
  %5 = landingpad { ptr, i32 }
          filter [0 x ptr] zeroinitializer
  %6 = extractvalue { ptr, i32 } %5, 0
  %7 = extractvalue { ptr, i32 } %5, 1
; call core::panicking::panic_in_cleanup
  call void @_ZN4core9panicking16panic_in_cleanup17h15db6728a9723d70E() #12
  unreachable

bb1:                                              ; preds = %bb3
  %8 = load ptr, ptr %0, align 8
  %9 = getelementptr inbounds i8, ptr %0, i64 8
  %10 = load i32, ptr %9, align 8
  %11 = insertvalue { ptr, i32 } poison, ptr %8, 0
  %12 = insertvalue { ptr, i32 } %11, i32 %10, 1
  resume { ptr, i32 } %12
}

; core::ptr::drop_in_place<alloc::raw_vec::RawVec<u8>>
; Function Attrs: nonlazybind uwtable
define void @"_ZN4core3ptr53drop_in_place$LT$alloc..raw_vec..RawVec$LT$u8$GT$$GT$17h80c7cc0eff8b52aeE"(ptr align 8 %_1) unnamed_addr #3 {
start:
; call <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
  call void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h62f01f2e447dbdedE"(ptr align 8 %_1)
  ret void
}

; core::hint::assert_unchecked::precondition_check
; Function Attrs: inlinehint nounwind nonlazybind uwtable
define internal void @_ZN4core4hint16assert_unchecked18precondition_check17h51ce8891b53137dfE(i1 zeroext %cond) unnamed_addr #0 {
start:
  br i1 %cond, label %bb2, label %bb1

bb1:                                              ; preds = %start
; call core::panicking::panic_nounwind
  call void @_ZN4core9panicking14panic_nounwind17h2f7749cb358aa979E(ptr align 1 @alloc_ab14703751a9eb3585c49b2e55e9a9e5, i64 104) #13
  unreachable

bb2:                                              ; preds = %start
  ret void
}

; core::option::Option<T>::map_or_else
; Function Attrs: inlinehint nonlazybind uwtable
define void @"_ZN4core6option15Option$LT$T$GT$11map_or_else17hce97105e7a16ded9E"(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %0, i64 %1, ptr align 8 %default) unnamed_addr #2 personality ptr @rust_eh_personality {
start:
  %2 = alloca [16 x i8], align 8
  %_10 = alloca [1 x i8], align 1
  %_9 = alloca [1 x i8], align 1
  %self = alloca [16 x i8], align 8
  store ptr %0, ptr %self, align 8
  %3 = getelementptr inbounds i8, ptr %self, i64 8
  store i64 %1, ptr %3, align 8
  store i8 1, ptr %_10, align 1
  store i8 1, ptr %_9, align 1
  %4 = load ptr, ptr %self, align 8
  %5 = ptrtoint ptr %4 to i64
  %6 = icmp eq i64 %5, 0
  %_4 = select i1 %6, i64 0, i64 1
  %7 = icmp eq i64 %_4, 0
  br i1 %7, label %bb2, label %bb3

bb2:                                              ; preds = %start
  store i8 0, ptr %_10, align 1
; invoke alloc::fmt::format::{{closure}}
  invoke void @"_ZN5alloc3fmt6format28_$u7b$$u7b$closure$u7d$$u7d$17h1eabbf9dd1c71753E"(ptr sret([24 x i8]) align 8 %_0, ptr align 8 %default)
          to label %bb5 unwind label %cleanup

bb3:                                              ; preds = %start
  %t.0 = load ptr, ptr %self, align 8
  %8 = getelementptr inbounds i8, ptr %self, i64 8
  %t.1 = load i64, ptr %8, align 8
  store i8 0, ptr %_9, align 1
; invoke core::ops::function::FnOnce::call_once
  invoke void @_ZN4core3ops8function6FnOnce9call_once17h95e0cb306777874aE(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %t.0, i64 %t.1)
          to label %bb4 unwind label %cleanup

bb11:                                             ; preds = %cleanup
  %9 = load i8, ptr %_9, align 1
  %10 = trunc i8 %9 to i1
  br i1 %10, label %bb10, label %bb7

cleanup:                                          ; preds = %bb3, %bb2
  %11 = landingpad { ptr, i32 }
          cleanup
  %12 = extractvalue { ptr, i32 } %11, 0
  %13 = extractvalue { ptr, i32 } %11, 1
  store ptr %12, ptr %2, align 8
  %14 = getelementptr inbounds i8, ptr %2, i64 8
  store i32 %13, ptr %14, align 8
  br label %bb11

bb5:                                              ; preds = %bb2
  br label %bb6

bb6:                                              ; preds = %bb9, %bb4, %bb5
  ret void

bb4:                                              ; preds = %bb3
  %15 = load i8, ptr %_10, align 1
  %16 = trunc i8 %15 to i1
  br i1 %16, label %bb9, label %bb6

bb9:                                              ; preds = %bb4
  br label %bb6

bb7:                                              ; preds = %bb10, %bb11
  %17 = load i8, ptr %_10, align 1
  %18 = trunc i8 %17 to i1
  br i1 %18, label %bb12, label %bb8

bb10:                                             ; preds = %bb11
  br label %bb7

bb8:                                              ; preds = %bb12, %bb7
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds i8, ptr %2, i64 8
  %21 = load i32, ptr %20, align 8
  %22 = insertvalue { ptr, i32 } poison, ptr %19, 0
  %23 = insertvalue { ptr, i32 } %22, i32 %21, 1
  resume { ptr, i32 } %23

bb12:                                             ; preds = %bb7
  br label %bb8

bb1:                                              ; No predecessors!
  unreachable
}

; core::ub_checks::maybe_is_nonoverlapping::runtime
; Function Attrs: inlinehint nonlazybind uwtable
define internal zeroext i1 @_ZN4core9ub_checks23maybe_is_nonoverlapping7runtime17hd473bd1505aa107aE(ptr %src, ptr %dst, i64 %size, i64 %count) unnamed_addr #2 {
start:
  %diff = alloca [8 x i8], align 8
  %_9 = alloca [16 x i8], align 8
  %src_usize = ptrtoint ptr %src to i64
  %dst_usize = ptrtoint ptr %dst to i64
  %0 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %size, i64 %count)
  %_14.0 = extractvalue { i64, i1 } %0, 0
  %_14.1 = extractvalue { i64, i1 } %0, 1
  br i1 %_14.1, label %bb1, label %bb3

bb3:                                              ; preds = %start
  %1 = getelementptr inbounds i8, ptr %_9, i64 8
  store i64 %_14.0, ptr %1, align 8
  store i64 1, ptr %_9, align 8
  %2 = getelementptr inbounds i8, ptr %_9, i64 8
  %size1 = load i64, ptr %2, align 8
  %_22 = icmp ult i64 %src_usize, %dst_usize
  br i1 %_22, label %bb4, label %bb5

bb1:                                              ; preds = %start
; call core::panicking::panic_nounwind
  call void @_ZN4core9panicking14panic_nounwind17h2f7749cb358aa979E(ptr align 1 @alloc_763310d78c99c2c1ad3f8a9821e942f3, i64 61) #13
  unreachable

bb5:                                              ; preds = %bb3
  %3 = sub i64 %src_usize, %dst_usize
  store i64 %3, ptr %diff, align 8
  br label %bb6

bb4:                                              ; preds = %bb3
  %4 = sub i64 %dst_usize, %src_usize
  store i64 %4, ptr %diff, align 8
  br label %bb6

bb6:                                              ; preds = %bb4, %bb5
  %_11 = load i64, ptr %diff, align 8
  %_0 = icmp uge i64 %_11, %size1
  ret i1 %_0
}

; <T as alloc::slice::hack::ConvertVec>::to_vec
; Function Attrs: inlinehint nonlazybind uwtable
define void @"_ZN52_$LT$T$u20$as$u20$alloc..slice..hack..ConvertVec$GT$6to_vec17h1336275112095003E"(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %s.0, i64 %s.1) unnamed_addr #2 {
start:
  %v = alloca [24 x i8], align 8
; call alloc::raw_vec::RawVecInner<A>::with_capacity_in
  %0 = call { i64, ptr } @"_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$16with_capacity_in17hd24471871526971dE"(i64 %s.1, i64 1, i64 1, ptr align 8 @alloc_c44662335dc386f389cccdbca327402f)
  %_10.0 = extractvalue { i64, ptr } %0, 0
  %_10.1 = extractvalue { i64, ptr } %0, 1
  store i64 %_10.0, ptr %v, align 8
  %1 = getelementptr inbounds i8, ptr %v, i64 8
  store ptr %_10.1, ptr %1, align 8
  %2 = getelementptr inbounds i8, ptr %v, i64 16
  store i64 0, ptr %2, align 8
  %3 = getelementptr inbounds i8, ptr %v, i64 8
  %_15 = load ptr, ptr %3, align 8
  br label %bb2

bb2:                                              ; preds = %start
; call core::intrinsics::copy_nonoverlapping::precondition_check
  call void @_ZN4core10intrinsics19copy_nonoverlapping18precondition_check17h0eda0ca2ad064635E(ptr %s.0, ptr %_15, i64 1, i64 1, i64 %s.1) #15
  br label %bb4

bb4:                                              ; preds = %bb2
  %4 = mul i64 %s.1, 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %_15, ptr align 1 %s.0, i64 %4, i1 false)
  %5 = getelementptr inbounds i8, ptr %v, i64 16
  store i64 %s.1, ptr %5, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %v, i64 24, i1 false)
  ret void
}

; alloc::fmt::format
; Function Attrs: inlinehint nonlazybind uwtable
define internal void @_ZN5alloc3fmt6format17heff9a630082f214fE(ptr sret([24 x i8]) align 8 %_0, ptr align 8 %args) unnamed_addr #2 {
start:
  %_2 = alloca [16 x i8], align 8
  %_6.0 = load ptr, ptr %args, align 8
  %0 = getelementptr inbounds i8, ptr %args, i64 8
  %_6.1 = load i64, ptr %0, align 8
  %1 = getelementptr inbounds i8, ptr %args, i64 16
  %_7.0 = load ptr, ptr %1, align 8
  %2 = getelementptr inbounds i8, ptr %1, i64 8
  %_7.1 = load i64, ptr %2, align 8
  %3 = icmp eq i64 %_6.1, 0
  br i1 %3, label %bb4, label %bb5

bb4:                                              ; preds = %start
  %4 = icmp eq i64 %_7.1, 0
  br i1 %4, label %bb8, label %bb3

bb5:                                              ; preds = %start
  %5 = icmp eq i64 %_6.1, 1
  br i1 %5, label %bb6, label %bb3

bb8:                                              ; preds = %bb4
  store ptr inttoptr (i64 1 to ptr), ptr %_2, align 8
  %6 = getelementptr inbounds i8, ptr %_2, i64 8
  store i64 0, ptr %6, align 8
  br label %bb2

bb3:                                              ; preds = %bb6, %bb5, %bb4
  %7 = load ptr, ptr @0, align 8
  %8 = load i64, ptr getelementptr inbounds (i8, ptr @0, i64 8), align 8
  store ptr %7, ptr %_2, align 8
  %9 = getelementptr inbounds i8, ptr %_2, i64 8
  store i64 %8, ptr %9, align 8
  br label %bb2

bb2:                                              ; preds = %bb3, %bb7, %bb8
  %10 = load ptr, ptr %_2, align 8
  %11 = getelementptr inbounds i8, ptr %_2, i64 8
  %12 = load i64, ptr %11, align 8
; call core::option::Option<T>::map_or_else
  call void @"_ZN4core6option15Option$LT$T$GT$11map_or_else17hce97105e7a16ded9E"(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %10, i64 %12, ptr align 8 %args)
  ret void

bb6:                                              ; preds = %bb5
  %13 = icmp eq i64 %_7.1, 0
  br i1 %13, label %bb7, label %bb3

bb7:                                              ; preds = %bb6
  %s = getelementptr inbounds { ptr, i64 }, ptr %_6.0, i64 0
  %14 = getelementptr inbounds { ptr, i64 }, ptr %_6.0, i64 0
  %_13.0 = load ptr, ptr %14, align 8
  %15 = getelementptr inbounds i8, ptr %14, i64 8
  %_13.1 = load i64, ptr %15, align 8
  store ptr %_13.0, ptr %_2, align 8
  %16 = getelementptr inbounds i8, ptr %_2, i64 8
  store i64 %_13.1, ptr %16, align 8
  br label %bb2
}

; alloc::fmt::format::{{closure}}
; Function Attrs: inlinehint nonlazybind uwtable
define void @"_ZN5alloc3fmt6format28_$u7b$$u7b$closure$u7d$$u7d$17h1eabbf9dd1c71753E"(ptr sret([24 x i8]) align 8 %_0, ptr align 8 %_1) unnamed_addr #2 {
start:
  %_2 = alloca [48 x i8], align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_2, ptr align 8 %_1, i64 48, i1 false)
; call alloc::fmt::format::format_inner
  call void @_ZN5alloc3fmt6format12format_inner17h351629be619cdf03E(ptr sret([24 x i8]) align 8 %_0, ptr align 8 %_2)
  ret void
}

; alloc::str::<impl alloc::borrow::ToOwned for str>::to_owned
; Function Attrs: inlinehint nonlazybind uwtable
define internal void @"_ZN5alloc3str56_$LT$impl$u20$alloc..borrow..ToOwned$u20$for$u20$str$GT$8to_owned17h566ec8d18e5db0baE"(ptr sret([24 x i8]) align 8 %_0, ptr align 1 %self.0, i64 %self.1) unnamed_addr #2 {
start:
  %bytes = alloca [24 x i8], align 8
; call <T as alloc::slice::hack::ConvertVec>::to_vec
  call void @"_ZN52_$LT$T$u20$as$u20$alloc..slice..hack..ConvertVec$GT$6to_vec17h1336275112095003E"(ptr sret([24 x i8]) align 8 %bytes, ptr align 1 %self.0, i64 %self.1)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_0, ptr align 8 %bytes, i64 24, i1 false)
  ret void
}

; alloc::raw_vec::RawVecInner<A>::with_capacity_in
; Function Attrs: inlinehint nonlazybind uwtable
define { i64, ptr } @"_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$16with_capacity_in17hd24471871526971dE"(i64 %capacity, i64 %elem_layout.0, i64 %elem_layout.1, ptr align 8 %0) unnamed_addr #2 {
start:
  %self = alloca [8 x i8], align 8
  %elem_layout = alloca [16 x i8], align 8
  %this = alloca [16 x i8], align 8
  %_4 = alloca [24 x i8], align 8
; call alloc::raw_vec::RawVecInner<A>::try_allocate_in
  call void @"_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$15try_allocate_in17he0937ae0da3ffbb3E"(ptr sret([24 x i8]) align 8 %_4, i64 %capacity, i1 zeroext false, i64 %elem_layout.0, i64 %elem_layout.1)
  %_5 = load i64, ptr %_4, align 8
  %1 = icmp eq i64 %_5, 0
  br i1 %1, label %bb4, label %bb3

bb4:                                              ; preds = %start
  %2 = getelementptr inbounds i8, ptr %_4, i64 8
  %3 = load i64, ptr %2, align 8
  %4 = getelementptr inbounds i8, ptr %2, i64 8
  %5 = load ptr, ptr %4, align 8
  store i64 %3, ptr %this, align 8
  %6 = getelementptr inbounds i8, ptr %this, i64 8
  store ptr %5, ptr %6, align 8
  store i64 %elem_layout.0, ptr %elem_layout, align 8
  %7 = getelementptr inbounds i8, ptr %elem_layout, i64 8
  store i64 %elem_layout.1, ptr %7, align 8
  %8 = icmp eq i64 %elem_layout.1, 0
  br i1 %8, label %bb6, label %bb7

bb3:                                              ; preds = %start
  %9 = getelementptr inbounds i8, ptr %_4, i64 8
  %err.0 = load i64, ptr %9, align 8
  %10 = getelementptr inbounds i8, ptr %9, i64 8
  %err.1 = load i64, ptr %10, align 8
; call alloc::raw_vec::handle_error
  call void @_ZN5alloc7raw_vec12handle_error17he39a50b4f8f417a7E(i64 %err.0, i64 %err.1, ptr align 8 %0) #11
  unreachable

bb6:                                              ; preds = %bb4
  store i64 -1, ptr %self, align 8
  br label %bb5

bb7:                                              ; preds = %bb4
  %11 = load i64, ptr %this, align 8
  store i64 %11, ptr %self, align 8
  br label %bb5

bb5:                                              ; preds = %bb7, %bb6
  %12 = load i64, ptr %self, align 8
  %_13 = sub i64 %12, 0
  %_8 = icmp ugt i64 %capacity, %_13
  %cond = xor i1 %_8, true
  br label %bb8

bb8:                                              ; preds = %bb5
; call core::hint::assert_unchecked::precondition_check
  call void @_ZN4core4hint16assert_unchecked18precondition_check17h51ce8891b53137dfE(i1 zeroext %cond) #15
  br label %bb9

bb9:                                              ; preds = %bb8
  %_0.0 = load i64, ptr %this, align 8
  %13 = getelementptr inbounds i8, ptr %this, i64 8
  %_0.1 = load ptr, ptr %13, align 8
  %14 = insertvalue { i64, ptr } poison, i64 %_0.0, 0
  %15 = insertvalue { i64, ptr } %14, ptr %_0.1, 1
  ret { i64, ptr } %15

bb2:                                              ; No predecessors!
  unreachable
}

; autocfg_0a2167df6a60be2b_1::probe
; Function Attrs: nonlazybind uwtable
define void @_ZN26autocfg_0a2167df6a60be2b_15probe17hd4059c8d0c6dfbacE() unnamed_addr #3 {
start:
  %_7 = alloca [16 x i8], align 8
  %_6 = alloca [16 x i8], align 8
  %_3 = alloca [48 x i8], align 8
  %res = alloca [24 x i8], align 8
  %_1 = alloca [24 x i8], align 8
; call core::fmt::rt::Argument::new_lower_exp
  call void @_ZN4core3fmt2rt8Argument13new_lower_exp17h9810041a7e40fca9E(ptr sret([16 x i8]) align 8 %_7, ptr align 8 @alloc_53973d2fe29b4adba8bb7390b5678745)
  %0 = getelementptr inbounds %"core::fmt::rt::Argument<'_>", ptr %_6, i64 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %0, ptr align 8 %_7, i64 16, i1 false)
; call core::fmt::Arguments::new_v1
  call void @_ZN4core3fmt9Arguments6new_v117hb57f6a36d65ec6d6E(ptr sret([48 x i8]) align 8 %_3, ptr align 8 @alloc_eab5d04767146d7d9b93b60d28ef530a, ptr align 8 %_6)
; call alloc::fmt::format
  call void @_ZN5alloc3fmt6format17heff9a630082f214fE(ptr sret([24 x i8]) align 8 %res, ptr align 8 %_3)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %_1, ptr align 8 %res, i64 24, i1 false)
; call core::ptr::drop_in_place<alloc::string::String>
  call void @"_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h04b57bf7649d4a6fE"(ptr align 8 %_1)
  ret void
}

; Function Attrs: nounwind nonlazybind uwtable
declare i32 @rust_eh_personality(i32, i32, i64, ptr, ptr) unnamed_addr #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctpop.i64(i64) #5

; core::panicking::panic_cannot_unwind
; Function Attrs: cold minsize noinline noreturn nounwind nonlazybind optsize uwtable
declare void @_ZN4core9panicking19panic_cannot_unwind17hf517234e476fc7c7E() unnamed_addr #6

; core::panicking::panic_fmt
; Function Attrs: cold noinline noreturn nonlazybind uwtable
declare void @_ZN4core9panicking9panic_fmt17hf8ffc7c15bfb58a0E(ptr align 8, ptr align 8) unnamed_addr #7

; core::panicking::panic_nounwind
; Function Attrs: cold noinline noreturn nounwind nonlazybind uwtable
declare void @_ZN4core9panicking14panic_nounwind17h2f7749cb358aa979E(ptr align 1, i64) unnamed_addr #8

; core::fmt::num::imp::<impl core::fmt::LowerExp for isize>::fmt
; Function Attrs: nonlazybind uwtable
declare zeroext i1 @"_ZN4core3fmt3num3imp55_$LT$impl$u20$core..fmt..LowerExp$u20$for$u20$isize$GT$3fmt17h564bb40e0c4b7a67E"(ptr align 8, ptr align 8) unnamed_addr #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #9

; <alloc::vec::Vec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: nonlazybind uwtable
declare void @"_ZN70_$LT$alloc..vec..Vec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h8174146e575bf946E"(ptr align 8) unnamed_addr #3

; core::panicking::panic_in_cleanup
; Function Attrs: cold minsize noinline noreturn nounwind nonlazybind optsize uwtable
declare void @_ZN4core9panicking16panic_in_cleanup17h15db6728a9723d70E() unnamed_addr #6

; <alloc::raw_vec::RawVec<T,A> as core::ops::drop::Drop>::drop
; Function Attrs: nonlazybind uwtable
declare void @"_ZN77_$LT$alloc..raw_vec..RawVec$LT$T$C$A$GT$$u20$as$u20$core..ops..drop..Drop$GT$4drop17h62f01f2e447dbdedE"(ptr align 8) unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #5

; alloc::fmt::format::format_inner
; Function Attrs: nonlazybind uwtable
declare void @_ZN5alloc3fmt6format12format_inner17h351629be619cdf03E(ptr sret([24 x i8]) align 8, ptr align 8) unnamed_addr #3

; alloc::raw_vec::RawVecInner<A>::try_allocate_in
; Function Attrs: nonlazybind uwtable
declare void @"_ZN5alloc7raw_vec20RawVecInner$LT$A$GT$15try_allocate_in17he0937ae0da3ffbb3E"(ptr sret([24 x i8]) align 8, i64, i1 zeroext, i64, i64) unnamed_addr #3

; alloc::raw_vec::handle_error
; Function Attrs: cold minsize noreturn nonlazybind optsize uwtable
declare void @_ZN5alloc7raw_vec12handle_error17he39a50b4f8f417a7E(i64, i64, ptr align 8) unnamed_addr #10

attributes #0 = { inlinehint nounwind nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #1 = { cold nounwind nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #2 = { inlinehint nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #3 = { nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #4 = { nounwind nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { cold minsize noinline noreturn nounwind nonlazybind optsize uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #7 = { cold noinline noreturn nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #8 = { cold noinline noreturn nounwind nonlazybind uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #9 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #10 = { cold minsize noreturn nonlazybind optsize uwtable "probe-stack"="inline-asm" "target-cpu"="x86-64" }
attributes #11 = { noreturn }
attributes #12 = { cold noreturn nounwind }
attributes #13 = { noreturn nounwind }
attributes #14 = { cold }
attributes #15 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 2, !"RtLibUseGOT", i32 1}
!2 = !{!"rustc version 1.85.1 (4eb161250 2025-03-15)"}
