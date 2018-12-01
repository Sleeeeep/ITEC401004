;; Auto-generated. Do not edit!


(when (boundp 'jw::projectMsg)
  (if (not (find-package "JW"))
    (make-package "JW"))
  (shadow 'projectMsg (find-package "JW")))
(unless (find-package "JW::PROJECTMSG")
  (make-package "JW::PROJECTMSG"))

(in-package "ROS")
;;//! \htmlinclude projectMsg.msg.html


(defclass jw::projectMsg
  :super ros::object
  :slots (_Direction _Move _Done ))

(defmethod jw::projectMsg
  (:init
   (&key
    ((:Direction __Direction) 0)
    ((:Move __Move) 0)
    ((:Done __Done) 0)
    )
   (send-super :init)
   (setq _Direction (round __Direction))
   (setq _Move (round __Move))
   (setq _Done (round __Done))
   self)
  (:Direction
   (&optional __Direction)
   (if __Direction (setq _Direction __Direction)) _Direction)
  (:Move
   (&optional __Move)
   (if __Move (setq _Move __Move)) _Move)
  (:Done
   (&optional __Done)
   (if __Done (setq _Done __Done)) _Done)
  (:serialization-length
   ()
   (+
    ;; int32 _Direction
    4
    ;; int32 _Move
    4
    ;; int32 _Done
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _Direction
       (write-long _Direction s)
     ;; int32 _Move
       (write-long _Move s)
     ;; int32 _Done
       (write-long _Done s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _Direction
     (setq _Direction (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Move
     (setq _Move (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _Done
     (setq _Done (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get jw::projectMsg :md5sum-) "d6f9748fb09b67c96badc84c2aee66af")
(setf (get jw::projectMsg :datatype-) "jw/projectMsg")
(setf (get jw::projectMsg :definition-)
      "int32 Direction
int32 Move
int32 Done

")



(provide :jw/projectMsg "d6f9748fb09b67c96badc84c2aee66af")


