; Auto-generated. Do not edit!


(cl:in-package ros_essentials_cpp-msg)


;//! \htmlinclude GilMessage.msg.html

(cl:defclass <GilMessage> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass GilMessage (<GilMessage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GilMessage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GilMessage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ros_essentials_cpp-msg:<GilMessage> is deprecated: use ros_essentials_cpp-msg:GilMessage instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <GilMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_essentials_cpp-msg:id-val is deprecated.  Use ros_essentials_cpp-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <GilMessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ros_essentials_cpp-msg:name-val is deprecated.  Use ros_essentials_cpp-msg:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GilMessage>) ostream)
  "Serializes a message object of type '<GilMessage>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GilMessage>) istream)
  "Deserializes a message object of type '<GilMessage>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GilMessage>)))
  "Returns string type for a message object of type '<GilMessage>"
  "ros_essentials_cpp/GilMessage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GilMessage)))
  "Returns string type for a message object of type 'GilMessage"
  "ros_essentials_cpp/GilMessage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GilMessage>)))
  "Returns md5sum for a message object of type '<GilMessage>"
  "8fe5a440459dcada9c353c016dfb49d2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GilMessage)))
  "Returns md5sum for a message object of type 'GilMessage"
  "8fe5a440459dcada9c353c016dfb49d2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GilMessage>)))
  "Returns full string definition for message of type '<GilMessage>"
  (cl:format cl:nil "int32 id~%string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GilMessage)))
  "Returns full string definition for message of type 'GilMessage"
  (cl:format cl:nil "int32 id~%string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GilMessage>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GilMessage>))
  "Converts a ROS message object to a list"
  (cl:list 'GilMessage
    (cl:cons ':id (id msg))
    (cl:cons ':name (name msg))
))
