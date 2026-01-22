(defun compute-f ()
  (let ((F (make-array 21)))
    (setf (aref F 1) 1.0)
    (setf (aref F 10) 1.0)

    (loop for i from 2 to 9 do
          (setf (aref F i)
                (sin (- (aref F (- i 1))
                        (cos i)))))

    (loop for i from 11 to 20 do
          (setf (aref F i)
                (cos (+ (aref F (- i 1))
                        (sin i)))))

    F))


(defun print-f (F)
  (loop for i from 1 to 20 do
        (format t "F[~A] = ~,15F~%" i (aref F i))))


(defun approx-equal (a b &optional (eps 1e-6))
  (< (abs (- a b)) eps))

(defun test-initial-values ()
  (let ((F (compute-f)))
    (and
     (approx-equal (aref F 1) 1.0)
     (approx-equal (aref F 10) 1.0))))

(defun test-sample-values ()
  (let ((F (compute-f)))
    (and
     (approx-equal (aref F 2) 0.988065600000000)
     (approx-equal (aref F 16) 0.962081600000000)
     (approx-equal (aref F 11) 1)
     (approx-equal (aref F 20) 0.219496900000000))))

(defun test-array-size ()
  (let ((F (compute-f)))
    (= (length F) 21)))

(defun run-tests ()
  (format t "Test initial values: ~A~%"
          (if (test-initial-values) "PASSED" "FAILED"))
  (format t "Test sample values: ~A~%"
          (if (test-sample-values) "PASSED" "FAILED"))
  (format t "Test array size: ~A~%"
          (if (test-array-size) "PASSED" "FAILED")))

(print-f (compute-f))
(run-tests)

