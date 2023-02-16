;; Auto-generated. Do not edit!


(when (boundp 'assignmentPackage::my_service)
  (if (not (find-package "ASSIGNMENTPACKAGE"))
    (make-package "ASSIGNMENTPACKAGE"))
  (shadow 'my_service (find-package "ASSIGNMENTPACKAGE")))
(unless (find-package "ASSIGNMENTPACKAGE::MY_SERVICE")
  (make-package "ASSIGNMENTPACKAGE::MY_SERVICE"))
(unless (find-package "ASSIGNMENTPACKAGE::MY_SERVICEREQUEST")
  (make-package "ASSIGNMENTPACKAGE::MY_SERVICEREQUEST"))
(unless (find-package "ASSIGNMENTPACKAGE::MY_SERVICERESPONSE")
  (make-package "ASSIGNMENTPACKAGE::MY_SERVICERESPONSE"))

(in-package "ROS")





(defclass assignmentPackage::my_serviceRequest
  :super ros::object
  :slots ())

(defmethod assignmentPackage::my_serviceRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass assignmentPackage::my_serviceResponse
  :super ros::object
  :slots (_count_canceled _count_reached ))

(defmethod assignmentPackage::my_serviceResponse
  (:init
   (&key
    ((:count_canceled __count_canceled) 0)
    ((:count_reached __count_reached) 0)
    )
   (send-super :init)
   (setq _count_canceled (round __count_canceled))
   (setq _count_reached (round __count_reached))
   self)
  (:count_canceled
   (&optional __count_canceled)
   (if __count_canceled (setq _count_canceled __count_canceled)) _count_canceled)
  (:count_reached
   (&optional __count_reached)
   (if __count_reached (setq _count_reached __count_reached)) _count_reached)
  (:serialization-length
   ()
   (+
    ;; int32 _count_canceled
    4
    ;; int32 _count_reached
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _count_canceled
       (write-long _count_canceled s)
     ;; int32 _count_reached
       (write-long _count_reached s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _count_canceled
     (setq _count_canceled (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _count_reached
     (setq _count_reached (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass assignmentPackage::my_service
  :super ros::object
  :slots ())

(setf (get assignmentPackage::my_service :md5sum-) "ffcd55a9f2e05d31bdbae1f2beae5298")
(setf (get assignmentPackage::my_service :datatype-) "assignmentPackage/my_service")
(setf (get assignmentPackage::my_service :request) assignmentPackage::my_serviceRequest)
(setf (get assignmentPackage::my_service :response) assignmentPackage::my_serviceResponse)

(defmethod assignmentPackage::my_serviceRequest
  (:response () (instance assignmentPackage::my_serviceResponse :init)))

(setf (get assignmentPackage::my_serviceRequest :md5sum-) "ffcd55a9f2e05d31bdbae1f2beae5298")
(setf (get assignmentPackage::my_serviceRequest :datatype-) "assignmentPackage/my_serviceRequest")
(setf (get assignmentPackage::my_serviceRequest :definition-)
      "---
int32 count_canceled
int32 count_reached

")

(setf (get assignmentPackage::my_serviceResponse :md5sum-) "ffcd55a9f2e05d31bdbae1f2beae5298")
(setf (get assignmentPackage::my_serviceResponse :datatype-) "assignmentPackage/my_serviceResponse")
(setf (get assignmentPackage::my_serviceResponse :definition-)
      "---
int32 count_canceled
int32 count_reached

")



(provide :assignmentPackage/my_service "ffcd55a9f2e05d31bdbae1f2beae5298")


