;; Auto-generated. Do not edit!


(when (boundp 'assignmentPackage::my_msg)
  (if (not (find-package "ASSIGNMENTPACKAGE"))
    (make-package "ASSIGNMENTPACKAGE"))
  (shadow 'my_msg (find-package "ASSIGNMENTPACKAGE")))
(unless (find-package "ASSIGNMENTPACKAGE::MY_MSG")
  (make-package "ASSIGNMENTPACKAGE::MY_MSG"))

(in-package "ROS")
;;//! \htmlinclude my_msg.msg.html


(defclass assignmentPackage::my_msg
  :super ros::object
  :slots (_vel_x _vel_y _position_x _position_y ))

(defmethod assignmentPackage::my_msg
  (:init
   (&key
    ((:vel_x __vel_x) 0.0)
    ((:vel_y __vel_y) 0.0)
    ((:position_x __position_x) 0.0)
    ((:position_y __position_y) 0.0)
    )
   (send-super :init)
   (setq _vel_x (float __vel_x))
   (setq _vel_y (float __vel_y))
   (setq _position_x (float __position_x))
   (setq _position_y (float __position_y))
   self)
  (:vel_x
   (&optional __vel_x)
   (if __vel_x (setq _vel_x __vel_x)) _vel_x)
  (:vel_y
   (&optional __vel_y)
   (if __vel_y (setq _vel_y __vel_y)) _vel_y)
  (:position_x
   (&optional __position_x)
   (if __position_x (setq _position_x __position_x)) _position_x)
  (:position_y
   (&optional __position_y)
   (if __position_y (setq _position_y __position_y)) _position_y)
  (:serialization-length
   ()
   (+
    ;; float32 _vel_x
    4
    ;; float32 _vel_y
    4
    ;; float32 _position_x
    4
    ;; float32 _position_y
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _vel_x
       (sys::poke _vel_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vel_y
       (sys::poke _vel_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _position_x
       (sys::poke _position_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _position_y
       (sys::poke _position_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _vel_x
     (setq _vel_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vel_y
     (setq _vel_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _position_x
     (setq _position_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _position_y
     (setq _position_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get assignmentPackage::my_msg :md5sum-) "2f135745c60f8a727cac612213be077d")
(setf (get assignmentPackage::my_msg :datatype-) "assignmentPackage/my_msg")
(setf (get assignmentPackage::my_msg :definition-)
      "float32 vel_x
float32 vel_y
float32 position_x
float32 position_y

")



(provide :assignmentPackage/my_msg "2f135745c60f8a727cac612213be077d")


