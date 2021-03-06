(defclass testgram (vg-vertex vg-color)
	((time :initform 0)
		(ticks :initform 0)))

(defmethod cg-init ((object testgram))
	(let ((alpha (coerce (plasma-fractal 0 0 128 128 (- 10 (random 20)) (- 10 (random 20)) (- 10 (random 20)) (- 10 (random 20)) 0 15 .5) 'vector)))
		(vg-load-data object :vert alpha :color (coerce (loop for i below (length alpha) collect (random 1.0)) 'vector))
		(loop repeat 30
			with i
			do (progn 
				(setf i (random (/ (length alpha) 3)))
				(insert-clispgram (make-instance 'treegram :location (list (aref alpha (* 3 i)) (aref alpha (+ 1 (* 3 i))) (aref alpha (+ 2 (* 3 i))))))))))

 (defmethod cg-evaluate ((object testgram)))

#|
(setf (slot-value object 'ticks) (1+ (slot-value object 'ticks)))
(if (> (slot-value object 'ticks) 2)
	(progn
		(setf (slot-value object 'ticks) 0)
		(testgram-update object)
		(setf (slot-value object 'update) t))))

(defmethod testgram-update ((object testgram))
	(loop for x below (length (slot-value object 'data))
		do (setf (aref (slot-value object 'data) x) (+ (sin (slot-value object 'time)) (aref (slot-value object 'data) x))))
	(setf (slot-value object 'time) (+ (slot-value object 'time) (/ pi 32)))

	(setf (slot-value object 'data) (vcoerce-singlef (slot-value object 'data))))
;(gl:bind-buffer :array-buffer (slot-value object 'vbo))
;(seq-sub-glbuf (slot-value object 'data) :float)
;(gl:bind-buffer :array-buffer 0))
|#

(defmethod cg-visualize ((object testgram))
	(call-next-method))