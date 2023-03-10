// Generated by gencpp from file assignmentPackage/my_serviceResponse.msg
// DO NOT EDIT!


#ifndef ASSIGNMENTPACKAGE_MESSAGE_MY_SERVICERESPONSE_H
#define ASSIGNMENTPACKAGE_MESSAGE_MY_SERVICERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace assignmentPackage
{
template <class ContainerAllocator>
struct my_serviceResponse_
{
  typedef my_serviceResponse_<ContainerAllocator> Type;

  my_serviceResponse_()
    : count_canceled(0)
    , count_reached(0)  {
    }
  my_serviceResponse_(const ContainerAllocator& _alloc)
    : count_canceled(0)
    , count_reached(0)  {
  (void)_alloc;
    }



   typedef int32_t _count_canceled_type;
  _count_canceled_type count_canceled;

   typedef int32_t _count_reached_type;
  _count_reached_type count_reached;





  typedef boost::shared_ptr< ::assignmentPackage::my_serviceResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::assignmentPackage::my_serviceResponse_<ContainerAllocator> const> ConstPtr;

}; // struct my_serviceResponse_

typedef ::assignmentPackage::my_serviceResponse_<std::allocator<void> > my_serviceResponse;

typedef boost::shared_ptr< ::assignmentPackage::my_serviceResponse > my_serviceResponsePtr;
typedef boost::shared_ptr< ::assignmentPackage::my_serviceResponse const> my_serviceResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::assignmentPackage::my_serviceResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::assignmentPackage::my_serviceResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::assignmentPackage::my_serviceResponse_<ContainerAllocator1> & lhs, const ::assignmentPackage::my_serviceResponse_<ContainerAllocator2> & rhs)
{
  return lhs.count_canceled == rhs.count_canceled &&
    lhs.count_reached == rhs.count_reached;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::assignmentPackage::my_serviceResponse_<ContainerAllocator1> & lhs, const ::assignmentPackage::my_serviceResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace assignmentPackage

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::assignmentPackage::my_serviceResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::assignmentPackage::my_serviceResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::assignmentPackage::my_serviceResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::assignmentPackage::my_serviceResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignmentPackage::my_serviceResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignmentPackage::my_serviceResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::assignmentPackage::my_serviceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ffcd55a9f2e05d31bdbae1f2beae5298";
  }

  static const char* value(const ::assignmentPackage::my_serviceResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xffcd55a9f2e05d31ULL;
  static const uint64_t static_value2 = 0xbdbae1f2beae5298ULL;
};

template<class ContainerAllocator>
struct DataType< ::assignmentPackage::my_serviceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "assignmentPackage/my_serviceResponse";
  }

  static const char* value(const ::assignmentPackage::my_serviceResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::assignmentPackage::my_serviceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 count_canceled\n"
"int32 count_reached\n"
"\n"
;
  }

  static const char* value(const ::assignmentPackage::my_serviceResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::assignmentPackage::my_serviceResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.count_canceled);
      stream.next(m.count_reached);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct my_serviceResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::assignmentPackage::my_serviceResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::assignmentPackage::my_serviceResponse_<ContainerAllocator>& v)
  {
    s << indent << "count_canceled: ";
    Printer<int32_t>::stream(s, indent + "  ", v.count_canceled);
    s << indent << "count_reached: ";
    Printer<int32_t>::stream(s, indent + "  ", v.count_reached);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ASSIGNMENTPACKAGE_MESSAGE_MY_SERVICERESPONSE_H
