(defun queens2 (n)
    (let ((a (make-array n))
          (u (make-array (+ n n -1) :initial-element t))
          (v (make-array (+ n n -1) :initial-element t))
          (m 0))
        (dotimes (i n) (setf (aref a i) i))
        (labels ((sub (i)
            (if (= i n)
                ;(push (copy-seq a) s)
                (incf m)
                (loop for k from i below n do
                    (let ((p (+ i (aref a k)))
                          (q (+ (- i (aref a k)) n -1)))
                        (when (and (aref u p) (aref v q))
                            (setf (aref u p) nil (aref v q) nil)
                            (rotatef (aref a i) (aref a k))
                            (sub (1+ i))
                            (setf (aref u p) t (aref v q) t)
                            (rotatef (aref a i) (aref a k))))))))
            (sub 0))
        m))
