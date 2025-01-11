import 'package:bright_impact/api/lib/openapi.dart';

/// Represents a power supply. Class PowerSupply should be used to deal with power supply data in the UI.
class PowerSupply {
  final String id;
  final PowerSupplyDtoTypeEnum type;
  final PowerSupplyDtoLastStatusEnum lastStatus;
  final String name;
  final String modelNumber;
  final String apiConfig;

  PowerSupply(this.id, this.type, this.lastStatus, this.name, this.modelNumber, this.apiConfig);

  PowerSupply.fromDto(PowerSupplyDto dto)
      : id = dto.id,
        type = dto.type,
        name = dto.name,
        lastStatus = dto.lastStatus,
        modelNumber = dto.modelNumber,
        apiConfig = dto.apiConfig;
}
