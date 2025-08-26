# 🔌 Adapter Design Pattern - Network Router Integration

## 📖 Overview

The **Adapter Pattern** is a structural design pattern that allows objects with incompatible interfaces to collaborate. It acts as a bridge between two incompatible interfaces by wrapping one of the objects and providing a compatible interface.

## 🎯 Problem Statement

In network management systems, different router manufacturers (Cisco, HP, Juniper) provide their network information in completely different formats:

- **Cisco**: Returns data as a `Map<String, dynamic>` with specific key names
- **HP**: Returns data as an **XML string** with vendor-specific tags
- **Juniper**: Returns data as a `Map<String, dynamic>` but with **different key names**

Without the Adapter pattern, the client would need to handle each vendor's format separately, leading to:
- ❌ **Code duplication**
- ❌ **Tight coupling** between client and vendor-specific classes
- ❌ **Maintenance nightmare** when adding new vendors
- ❌ **Violation of Open/Closed Principle**

## 💡 Solution: Adapter Pattern

The Adapter pattern solves this by:
1. **Defining a common interface** (`NetworkInformation`) that the client expects
2. **Creating adapter classes** that implement this interface
3. **Wrapping vendor-specific objects** and translating their data to the common format
4. **Allowing the client** to work with all vendors through the same interface

## 🏗️ Implementation Structure

### Core Components

#### 1. **Target Interface** (`NetworkInformation`)
```dart
abstract class NetworkInformation {
  Map<String, dynamic> getNetworkInfo();
}
```
- Defines the interface that the client expects
- All adapters must implement this interface

#### 2. **Adaptees** (Vendor-Specific Classes)

**Cisco Router** (Compatible format, but direct dependency):
```dart
class CiscoRouter {
  Map<String, dynamic> getNetworkInfo() {
    return {
      'Router_Id': 'Cisco123',
      'Bandwidth_Available': '123Mbps',
      'SecurityStatus': 'High',
      'Network_Health': "95%",
    };
  }
}
```

**HP Router** (Incompatible XML format):
```dart
class HpRouter {
  String getHpNetworkInformation() {
    return '''
    <HpRouterInfo>
      <Hp_Router_Id>Hp123</Hp_Router_Id>
      <Hp_Bandwidth_Available>123Mbps</Hp_Bandwidth_Available>
      <Hp_SecurityStatus>High</Hp_SecurityStatus>
      <Hp_Network_Health>95%</Hp_Network_Health>
    </HpRouterInfo>
    ''';
  }
}
```

**Juniper Router** (Different key names):
```dart
class JuniperRouter {
  Map<String, dynamic> fetchNetworkStatistics() {
    return {
      'Router': 'Juniper123',      // Different key name
      'Bandwidth': '123Mbps',      // Different key name
      'Security': 'High',          // Different key name
      'Health': "95%",             // Different key name
    };
  }
}
```

#### 3. **Adapters** (Translation Layer)

**Cisco Network Adapter**:
```dart
class CiscoNetworkAdapter implements NetworkInformation {
  final CiscoRouter ciscoRouter = CiscoRouter();
  
  @override
  Map<String, dynamic> getNetworkInfo() {
    try {
      Map<String, dynamic> ciscoInfo = ciscoRouter.getNetworkInfo();
      return {
        'Router_Id': ciscoInfo['Router_Id'],
        'Bandwidth_Available': ciscoInfo['Bandwidth_Available'],
        'SecurityStatus': ciscoInfo['SecurityStatus'],
        'Network_Health': ciscoInfo['Network_Health'],
      };
    } catch (e) {
      // Return default error values
      return _getDefaultErrorResponse();
    }
  }
}
```

**HP Network Adapter** (XML Parsing):
```dart
class HpNetworkAdapter implements NetworkInformation {
  final HpRouter hpRouter = HpRouter();

  @override
  Map<String, dynamic> getNetworkInfo() {
    try {
      String hpInfo = hpRouter.getHpNetworkInformation();
      final document = XmlDocument.parse(hpInfo);
      
      return {
        'Router_Id': document.findAllElements('Hp_Router_Id').first.innerText,
        'Bandwidth_Available': document.findAllElements('Hp_Bandwidth_Available').first.innerText,
        'SecurityStatus': document.findAllElements('Hp_SecurityStatus').first.innerText,
        'Network_Health': document.findAllElements('Hp_Network_Health').first.innerText,
      };
    } catch (e) {
      return _getDefaultErrorResponse();
    }
  }
}
```

**Juniper Network Adapter** (Key Mapping):
```dart
class JuniperNetworkAdapter implements NetworkInformation {
  final JuniperRouter juniperRouter = JuniperRouter();

  @override
  Map<String, dynamic> getNetworkInfo() {
    try {
      Map<String, dynamic> juniperInfo = juniperRouter.fetchNetworkStatistics();
      
      // Map vendor-specific keys to standard keys
      return {
        'Router_Id': juniperInfo['Router'],          // Router -> Router_Id
        'Bandwidth_Available': juniperInfo['Bandwidth'], // Bandwidth -> Bandwidth_Available
        'SecurityStatus': juniperInfo['Security'],   // Security -> SecurityStatus
        'Network_Health': juniperInfo['Health'],     // Health -> Network_Health
      };
    } catch (e) {
      return _getDefaultErrorResponse();
    }
  }
}
```

## 🚀 How to Run

### Prerequisites
- **Dart SDK** (version 2.12 or higher)
- **XML package** (add to `pubspec.yaml`):
```yaml
dependencies:
  xml: ^6.1.0
```

### Installation
```bash
# Navigate to the Adapter directory
cd Structural/Adapter

# Get dependencies
dart pub get
```

### Execution
```bash
# Run the network monitoring system
dart run main.dart
```

## 🎮 Usage Example

### Interactive Menu System
```
=== Network Monitoring System ===
1. Show Cisco Router Info
2. Show HP Router Info
3. Show Juniper Router Info
4. Show Overall Network Statistics
5. Exit

Enter your choice: 1
```

### Sample Output
```
--- Cisco Router ---
Router_Id : Cisco123
Bandwidth_Available : 123Mbps
SecurityStatus : High
Network_Health : 95%

--- HP Router ---
Router_Id : Hp123
Bandwidth_Available : 123Mbps
SecurityStatus : High
Network_Health : 95%

--- Juniper Router ---
Router_Id : Juniper123
Bandwidth_Available : 123Mbps
SecurityStatus : High
Network_Health : 95%
```

## 📊 Key Benefits Demonstrated

### 1. **Uniform Interface** 
All routers provide the same data structure:
```dart
{
  'Router_Id': 'vendor_specific_id',
  'Bandwidth_Available': 'value_with_unit',
  'SecurityStatus': 'security_level',
  'Network_Health': 'percentage_value'
}
```

### 2. **Client Simplicity**
The client code remains the same regardless of vendor:
```dart
NetworkInformation networkInfo = CiscoNetworkAdapter();  // or HP, or Juniper
Map<String, dynamic> data = networkInfo.getNetworkInfo();
printRouterInfo("Router Name", data);
```

### 3. **Error Handling**
All adapters provide consistent error handling:
```dart
// If any adapter fails, it returns:
{
  'Router_Id': 'UNREACHABLE',
  'Bandwidth_Available': 'UNKNOWN',
  'SecurityStatus': 'UNKNOWN',
  'Network_Health': 'UNKNOWN'
}
```

### 4. **Extensibility**
Adding a new vendor requires only:
- ✅ Creating a new adaptee class
- ✅ Creating a new adapter class
- ✅ No changes to existing client code

## 🎯 When to Use Adapter Pattern

### ✅ **Use When:**
- You need to integrate **third-party libraries** with incompatible interfaces
- You want to **reuse existing classes** that don't fit your interface
- You need to make **legacy code** work with modern systems
- Different data sources provide the **same information in different formats**

### ❌ **Avoid When:**
- You control both the client and service interfaces (use direct implementation)
- The interfaces are already compatible
- You only have one data source (unnecessary complexity)

## 🔧 Advanced Features

### 1. **Error Recovery**
Each adapter handles vendor-specific errors gracefully and provides fallback values.

### 2. **Data Transformation**
- **HP Adapter**: Parses complex XML structure
- **Juniper Adapter**: Maps different key names
- **Cisco Adapter**: Direct passthrough with error handling

### 3. **Consistent Interface**
All adapters implement the same `NetworkInformation` interface, ensuring:
- **Polymorphism**: Can be used interchangeably
- **Type Safety**: Compile-time checking
- **Documentation**: Clear contract definition

## 📚 Learning Outcomes

After studying this implementation, you'll understand:

1. **How to integrate incompatible systems** without modifying their source code
2. **XML parsing and data transformation** techniques in Dart
3. **Error handling strategies** in adapter implementations
4. **Polymorphism and interface design** best practices
5. **Real-world application** of the Adapter pattern in network management

## 🏆 Pattern Benefits Summary

| Benefit | Description | Example in This Implementation |
|---------|-------------|-------------------------------|
| **Compatibility** | Makes incompatible interfaces work together | HP XML ↔ Standard Map format |
| **Reusability** | Reuses existing vendor code without modification | All vendor classes remain unchanged |
| **Maintainability** | Isolates adaptation logic in dedicated classes | Each adapter handles one vendor |
| **Testability** | Each adapter can be tested independently | Mock individual vendor responses |
| **Flexibility** | Easy to add new vendors or modify existing ones | Add new router brand = Add new adapter |

---

**🎉 Master the Adapter Pattern through practical network integration!**

*Transform incompatible interfaces into seamless collaboration.*
