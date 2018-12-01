// Auto-generated. Do not edit!

// (in-package jw.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class projectMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Direction = null;
      this.Move = null;
      this.Done = null;
    }
    else {
      if (initObj.hasOwnProperty('Direction')) {
        this.Direction = initObj.Direction
      }
      else {
        this.Direction = 0;
      }
      if (initObj.hasOwnProperty('Move')) {
        this.Move = initObj.Move
      }
      else {
        this.Move = 0;
      }
      if (initObj.hasOwnProperty('Done')) {
        this.Done = initObj.Done
      }
      else {
        this.Done = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type projectMsg
    // Serialize message field [Direction]
    bufferOffset = _serializer.int32(obj.Direction, buffer, bufferOffset);
    // Serialize message field [Move]
    bufferOffset = _serializer.int32(obj.Move, buffer, bufferOffset);
    // Serialize message field [Done]
    bufferOffset = _serializer.int32(obj.Done, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type projectMsg
    let len;
    let data = new projectMsg(null);
    // Deserialize message field [Direction]
    data.Direction = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Move]
    data.Move = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [Done]
    data.Done = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'jw/projectMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd6f9748fb09b67c96badc84c2aee66af';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 Direction
    int32 Move
    int32 Done
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new projectMsg(null);
    if (msg.Direction !== undefined) {
      resolved.Direction = msg.Direction;
    }
    else {
      resolved.Direction = 0
    }

    if (msg.Move !== undefined) {
      resolved.Move = msg.Move;
    }
    else {
      resolved.Move = 0
    }

    if (msg.Done !== undefined) {
      resolved.Done = msg.Done;
    }
    else {
      resolved.Done = 0
    }

    return resolved;
    }
};

module.exports = projectMsg;
