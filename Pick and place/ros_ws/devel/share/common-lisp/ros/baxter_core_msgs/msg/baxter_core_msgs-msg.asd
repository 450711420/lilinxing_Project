
(cl:in-package :asdf)

(defsystem "baxter_core_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "DigitalIOState" :depends-on ("_package_DigitalIOState"))
    (:file "_package_DigitalIOState" :depends-on ("_package"))
    (:file "EndEffectorProperties" :depends-on ("_package_EndEffectorProperties"))
    (:file "_package_EndEffectorProperties" :depends-on ("_package"))
    (:file "SEAJointState" :depends-on ("_package_SEAJointState"))
    (:file "_package_SEAJointState" :depends-on ("_package"))
    (:file "HeadState" :depends-on ("_package_HeadState"))
    (:file "_package_HeadState" :depends-on ("_package"))
    (:file "HeadPanCommand" :depends-on ("_package_HeadPanCommand"))
    (:file "_package_HeadPanCommand" :depends-on ("_package"))
    (:file "AnalogIOState" :depends-on ("_package_AnalogIOState"))
    (:file "_package_AnalogIOState" :depends-on ("_package"))
    (:file "NavigatorState" :depends-on ("_package_NavigatorState"))
    (:file "_package_NavigatorState" :depends-on ("_package"))
    (:file "NavigatorStates" :depends-on ("_package_NavigatorStates"))
    (:file "_package_NavigatorStates" :depends-on ("_package"))
    (:file "CollisionAvoidanceState" :depends-on ("_package_CollisionAvoidanceState"))
    (:file "_package_CollisionAvoidanceState" :depends-on ("_package"))
    (:file "CollisionDetectionState" :depends-on ("_package_CollisionDetectionState"))
    (:file "_package_CollisionDetectionState" :depends-on ("_package"))
    (:file "AssemblyStates" :depends-on ("_package_AssemblyStates"))
    (:file "_package_AssemblyStates" :depends-on ("_package"))
    (:file "EndEffectorCommand" :depends-on ("_package_EndEffectorCommand"))
    (:file "_package_EndEffectorCommand" :depends-on ("_package"))
    (:file "CameraControl" :depends-on ("_package_CameraControl"))
    (:file "_package_CameraControl" :depends-on ("_package"))
    (:file "URDFConfiguration" :depends-on ("_package_URDFConfiguration"))
    (:file "_package_URDFConfiguration" :depends-on ("_package"))
    (:file "DigitalIOStates" :depends-on ("_package_DigitalIOStates"))
    (:file "_package_DigitalIOStates" :depends-on ("_package"))
    (:file "DigitalOutputCommand" :depends-on ("_package_DigitalOutputCommand"))
    (:file "_package_DigitalOutputCommand" :depends-on ("_package"))
    (:file "EndpointStates" :depends-on ("_package_EndpointStates"))
    (:file "_package_EndpointStates" :depends-on ("_package"))
    (:file "AnalogOutputCommand" :depends-on ("_package_AnalogOutputCommand"))
    (:file "_package_AnalogOutputCommand" :depends-on ("_package"))
    (:file "AnalogIOStates" :depends-on ("_package_AnalogIOStates"))
    (:file "_package_AnalogIOStates" :depends-on ("_package"))
    (:file "RobustControllerStatus" :depends-on ("_package_RobustControllerStatus"))
    (:file "_package_RobustControllerStatus" :depends-on ("_package"))
    (:file "AssemblyState" :depends-on ("_package_AssemblyState"))
    (:file "_package_AssemblyState" :depends-on ("_package"))
    (:file "EndpointState" :depends-on ("_package_EndpointState"))
    (:file "_package_EndpointState" :depends-on ("_package"))
    (:file "EndEffectorState" :depends-on ("_package_EndEffectorState"))
    (:file "_package_EndEffectorState" :depends-on ("_package"))
    (:file "JointCommand" :depends-on ("_package_JointCommand"))
    (:file "_package_JointCommand" :depends-on ("_package"))
    (:file "CameraSettings" :depends-on ("_package_CameraSettings"))
    (:file "_package_CameraSettings" :depends-on ("_package"))
  ))