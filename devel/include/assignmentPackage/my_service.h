// Generated by gencpp from file assignmentPackage/my_service.msg
// DO NOT EDIT!


#ifndef ASSIGNMENTPACKAGE_MESSAGE_MY_SERVICE_H
#define ASSIGNMENTPACKAGE_MESSAGE_MY_SERVICE_H

#include <ros/service_traits.h>


#include <assignmentPackage/my_serviceRequest.h>
#include <assignmentPackage/my_serviceResponse.h>


namespace assignmentPackage
{

struct my_service
{

typedef my_serviceRequest Request;
typedef my_serviceResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct my_service
} // namespace assignmentPackage


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::assignmentPackage::my_service > {
  static const char* value()
  {
    return "ffcd55a9f2e05d31bdbae1f2beae5298";
  }

  static const char* value(const ::assignmentPackage::my_service&) { return value(); }
};

template<>
struct DataType< ::assignmentPackage::my_service > {
  static const char* value()
  {
    return "assignmentPackage/my_service";
  }

  static const char* value(const ::assignmentPackage::my_service&) { return value(); }
};


// service_traits::MD5Sum< ::assignmentPackage::my_serviceRequest> should match
// service_traits::MD5Sum< ::assignmentPackage::my_service >
template<>
struct MD5Sum< ::assignmentPackage::my_serviceRequest>
{
  static const char* value()
  {
    return MD5Sum< ::assignmentPackage::my_service >::value();
  }
  static const char* value(const ::assignmentPackage::my_serviceRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::assignmentPackage::my_serviceRequest> should match
// service_traits::DataType< ::assignmentPackage::my_service >
template<>
struct DataType< ::assignmentPackage::my_serviceRequest>
{
  static const char* value()
  {
    return DataType< ::assignmentPackage::my_service >::value();
  }
  static const char* value(const ::assignmentPackage::my_serviceRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::assignmentPackage::my_serviceResponse> should match
// service_traits::MD5Sum< ::assignmentPackage::my_service >
template<>
struct MD5Sum< ::assignmentPackage::my_serviceResponse>
{
  static const char* value()
  {
    return MD5Sum< ::assignmentPackage::my_service >::value();
  }
  static const char* value(const ::assignmentPackage::my_serviceResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::assignmentPackage::my_serviceResponse> should match
// service_traits::DataType< ::assignmentPackage::my_service >
template<>
struct DataType< ::assignmentPackage::my_serviceResponse>
{
  static const char* value()
  {
    return DataType< ::assignmentPackage::my_service >::value();
  }
  static const char* value(const ::assignmentPackage::my_serviceResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ASSIGNMENTPACKAGE_MESSAGE_MY_SERVICE_H
