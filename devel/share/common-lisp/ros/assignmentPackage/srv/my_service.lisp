; Auto-generated. Do not edit!


(cl:in-package assignmentPackage-srv)


;//! \htmlinclude my_service-request.msg.html

(cl:defclass <my_service-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass my_service-request (<my_service-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <my_service-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'my_service-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignmentPackage-srv:<my_service-request> is deprecated: use assignmentPackage-srv:my_service-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <my_service-request>) ostream)
  "Serializes a message object of type '<my_service-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <my_service-request>) istream)
  "Deserializes a message object of type '<my_service-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<my_service-request>)))
  "Returns string type for a service object of type '<my_service-request>"
  "assignmentPackage/my_serviceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'my_service-request)))
  "Returns string type for a service object of type 'my_service-request"
  "assignmentPackage/my_serviceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<my_service-request>)))
  "Returns md5sum for a message object of type '<my_service-request>"
  "ffcd55a9f2e05d31bdbae1f2beae5298")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'my_service-request)))
  "Returns md5sum for a message object of type 'my_service-request"
  "ffcd55a9f2e05d31bdbae1f2beae5298")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<my_service-request>)))
  "Returns full string definition for message of type '<my_service-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'my_service-request)))
  "Returns full string definition for message of type 'my_service-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <my_service-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <my_service-request>))
  "Converts a ROS message object to a list"
  (cl:list 'my_service-request
))
;//! \htmlinclude my_service-response.msg.html

(cl:defclass <my_service-response> (roslisp-msg-protocol:ros-message)
  ((count_canceled
    :reader count_canceled
    :initarg :count_canceled
    :type cl:integer
    :initform 0)
   (count_reached
    :reader count_reached
    :initarg :count_reached
    :type cl:integer
    :initform 0))
)

(cl:defclass my_service-response (<my_service-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <my_service-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'my_service-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name assignmentPackage-srv:<my_service-response> is deprecated: use assignmentPackage-srv:my_service-response instead.")))

(cl:ensure-generic-function 'count_canceled-val :lambda-list '(m))
(cl:defmethod count_canceled-val ((m <my_service-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignmentPackage-srv:count_canceled-val is deprecated.  Use assignmentPackage-srv:count_canceled instead.")
  (count_canceled m))

(cl:ensure-generic-function 'count_reached-val :lambda-list '(m))
(cl:defmethod count_reached-val ((m <my_service-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader assignmentPackage-srv:count_reached-val is deprecated.  Use assignmentPackage-srv:count_reached instead.")
  (count_reached m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <my_service-response>) ostream)
  "Serializes a message object of type '<my_service-response>"
  (cl:let* ((signed (cl:slot-value msg 'count_canceled)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'count_reached)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <my_service-response>) istream)
  "Deserializes a message object of type '<my_service-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'count_canceled) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'count_reached) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<my_service-response>)))
  "Returns string type for a service object of type '<my_service-response>"
  "assignmentPackage/my_serviceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'my_service-response)))
  "Returns string type for a service object of type 'my_service-response"
  "assignmentPackage/my_serviceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<my_service-response>)))
  "Returns md5sum for a message object of type '<my_service-response>"
  "ffcd55a9f2e05d31bdbae1f2beae5298")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'my_service-response)))
  "Returns md5sum for a message object of type 'my_service-response"
  "ffcd55a9f2e05d31bdbae1f2beae5298")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<my_service-response>)))
  "Returns full string definition for message of type '<my_service-response>"
  (cl:format cl:nil "int32 count_canceled~%int32 count_reached~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'my_service-response)))
  "Returns full string definition for message of type 'my_service-response"
  (cl:format cl:nil "int32 count_canceled~%int32 count_reached~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <my_service-response>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <my_service-response>))
  "Converts a ROS message object to a list"
  (cl:list 'my_service-response
    (cl:cons ':count_canceled (count_canceled msg))
    (cl:cons ':count_reached (count_reached msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'my_service)))
  'my_service-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'my_service)))
  'my_service-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'my_service)))
  "Returns string type for a service object of type '<my_service>"
  "assignmentPackage/my_service")