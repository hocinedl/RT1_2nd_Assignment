// Auto-generated. Do not edit!

// (in-package assignmentPackage.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class my_serviceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type my_serviceRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type my_serviceRequest
    let len;
    let data = new my_serviceRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignmentPackage/my_serviceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new my_serviceRequest(null);
    return resolved;
    }
};

class my_serviceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.count_canceled = null;
      this.count_reached = null;
    }
    else {
      if (initObj.hasOwnProperty('count_canceled')) {
        this.count_canceled = initObj.count_canceled
      }
      else {
        this.count_canceled = 0;
      }
      if (initObj.hasOwnProperty('count_reached')) {
        this.count_reached = initObj.count_reached
      }
      else {
        this.count_reached = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type my_serviceResponse
    // Serialize message field [count_canceled]
    bufferOffset = _serializer.int32(obj.count_canceled, buffer, bufferOffset);
    // Serialize message field [count_reached]
    bufferOffset = _serializer.int32(obj.count_reached, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type my_serviceResponse
    let len;
    let data = new my_serviceResponse(null);
    // Deserialize message field [count_canceled]
    data.count_canceled = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [count_reached]
    data.count_reached = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignmentPackage/my_serviceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ffcd55a9f2e05d31bdbae1f2beae5298';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 count_canceled
    int32 count_reached
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new my_serviceResponse(null);
    if (msg.count_canceled !== undefined) {
      resolved.count_canceled = msg.count_canceled;
    }
    else {
      resolved.count_canceled = 0
    }

    if (msg.count_reached !== undefined) {
      resolved.count_reached = msg.count_reached;
    }
    else {
      resolved.count_reached = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: my_serviceRequest,
  Response: my_serviceResponse,
  md5sum() { return 'ffcd55a9f2e05d31bdbae1f2beae5298'; },
  datatype() { return 'assignmentPackage/my_service'; }
};
