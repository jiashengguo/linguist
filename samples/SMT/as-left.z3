; FILE FROM https://github.com/hipsleek/hipsleek/blob/6cb3008bc7a3bc633ec59446892705899619e392/demo/array/as-left.z3
; MIT LICENSE

;; proof extracted from arr_sum_left.java
(set-logic AUFNIA)
(declare-fun v_int_25_629 () Int)
(declare-fun ahalb () Int)
(declare-fun ahaub () Int)
(declare-fun v_int_25_639 () Int)
(declare-fun a () (Array Int Int))
(declare-fun i () Int)
(declare-fun j () Int)
(declare-fun v_int_25_590' () Int)
(declare-fun sumarray ((Array Int Int) Int Int Int) Bool)
;; lemma below can be added by hand ..
;; (assert (forall (a (Array Int Int)) (i Int) (j Int) (s Int) (= (sumarray a i j s) (or (and (> i j) (= s 0)) (or (and (= i j) (= s (select a i))) (and (< i j) (sumarray a i (- j 1) (- s (select a j)))))))))
(assert (forall (a (Array Int Int)) (i Int) (j Int) (s Int) (= (sumarray a i j s) (or (and (> i j) (= s 0)) (or (and (= i j) (= s (select a i))) (and (< i j) (sumarray a (+ i 1) j (- s (select a i)))))))))
;; more concise lemma .. == is better than =>
;;(assert (forall (a (Array Int Int)) (i Int) (j Int) (s Int) (=> (< i j) (= (sumarray a i j s) (sumarray a i (- j 1) (- s (select a j)))  ) ) ))
(assert (forall (a (Array Int Int)) (i Int) (j Int) (s Int) (=> (< i j) (=> (sumarray a i (- j 1) (- s (select a j))) (sumarray a i j s)   ) ) ))
(assert (<= v_int_25_629 ahaub))
(assert (<= i j))
(assert (= (+ v_int_25_629 1) j))
(assert (<= ahalb i))
(assert (sumarray a i v_int_25_629 v_int_25_639))
(assert (<= ahalb j))
(assert (<= j ahaub))
(assert (= v_int_25_590' (+ (select a j) v_int_25_639)))
(assert (not (sumarray a i j v_int_25_590')))
(check-sat)
