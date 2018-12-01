; Auto-generated. Do not edit!


(cl:in-package jw-msg)


;//! \htmlinclude projectMsg.msg.html

(cl:defclass <projectMsg> (roslisp-msg-protocol:ros-message)
  ((Direction
    :reader Direction
    :initarg :Direction
    :type cl:integer
    :initform 0)
   (Move
    :reader Move
    :initarg :Move
    :type cl:integer
    :initform 0)
   (Done
    :reader Done
    :initarg :Done
    :type cl:integer
    :initform 0))
)

(cl:defclass projectMsg (<projectMsg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <projectMsg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'projectMsg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name jw-msg:<projectMsg> is deprecated: use jw-msg:projectMsg instead.")))

(cl:ensure-generic-function 'Direction-val :lambda-list '(m))
(cl:defmethod Direction-val ((m <projectMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jw-msg:Direction-val is deprecated.  Use jw-msg:Direction instead.")
  (Direction m))

(cl:ensure-generic-function 'Move-val :lambda-list '(m))
(cl:defmethod Move-val ((m <projectMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jw-msg:Move-val is deprecated.  Use jw-msg:Move instead.")
  (Move m))

(cl:ensure-generic-function 'Done-val :lambda-list '(m))
(cl:defmethod Done-val ((m <projectMsg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader jw-msg:Done-val is deprecated.  Use jw-msg:Done instead.")
  (Done m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <projectMsg>) ostream)
  "Serializes a message object of type '<projectMsg>"
  (cl:let* ((signed (cl:slot-value msg 'Direction)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Move)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'Done)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <projectMsg>) istream)
  "Deserializes a message object of type '<projectMsg>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Direction) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Move) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'Done) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<projectMsg>)))
  "Returns string type for a message object of type '<projectMsg>"
  "jw/projectMsg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'projectMsg)))
  "Returns string type for a message object of type 'projectMsg"
  "jw/projectMsg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<projectMsg>)))
  "Returns md5sum for a message object of type '<projectMsg>"
  "d6f9748fb09b67c96badc84c2aee66af")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'projectMsg)))
  "Returns md5sum for a message object of type 'projectMsg"
  "d6f9748fb09b67c96badc84c2aee66af")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<projectMsg>)))
  "Returns full string definition for message of type '<projectMsg>"
  (cl:format cl:nil "int32 Direction~%int32 Move~%int32 Done~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'projectMsg)))
  "Returns full string definition for message of type 'projectMsg"
  (cl:format cl:nil "int32 Direction~%int32 Move~%int32 Done~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <projectMsg>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <projectMsg>))
  "Converts a ROS message object to a list"
  (cl:list 'projectMsg
    (cl:cons ':Direction (Direction msg))
    (cl:cons ':Move (Move msg))
    (cl:cons ':Done (Done msg))
))
