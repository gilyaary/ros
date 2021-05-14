;; Auto-generated. Do not edit!


(when (boundp 'ros_essentials_cpp::GilMessage)
  (if (not (find-package "ROS_ESSENTIALS_CPP"))
    (make-package "ROS_ESSENTIALS_CPP"))
  (shadow 'GilMessage (find-package "ROS_ESSENTIALS_CPP")))
(unless (find-package "ROS_ESSENTIALS_CPP::GILMESSAGE")
  (make-package "ROS_ESSENTIALS_CPP::GILMESSAGE"))

(in-package "ROS")
;;//! \htmlinclude GilMessage.msg.html


(defclass ros_essentials_cpp::GilMessage
  :super ros::object
  :slots (_id _name ))

(defmethod ros_essentials_cpp::GilMessage
  (:init
   (&key
    ((:id __id) 0)
    ((:name __name) "")
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _name (string __name))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get ros_essentials_cpp::GilMessage :md5sum-) "8fe5a440459dcada9c353c016dfb49d2")
(setf (get ros_essentials_cpp::GilMessage :datatype-) "ros_essentials_cpp/GilMessage")
(setf (get ros_essentials_cpp::GilMessage :definition-)
      "int32 id
string name

")



(provide :ros_essentials_cpp/GilMessage "8fe5a440459dcada9c353c016dfb49d2")


