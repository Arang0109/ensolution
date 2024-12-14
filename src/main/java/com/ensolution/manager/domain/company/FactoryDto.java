package com.ensolution.manager.domain.company;

public class FactoryDto {
  private Integer factory_id;
  private Integer workplace_id;
  private String name;

  public FactoryDto() {}

  public FactoryDto(Integer factory_id, Integer workplace_id, String name) {
    this.factory_id = factory_id;
    this.workplace_id = workplace_id;
    this.name = name;
  }

  public Integer getFactory_id() {
    return factory_id;
  }

  public void setFactory_id(Integer factory_id) {
    this.factory_id = factory_id;
  }

  public Integer getWorkplace_id() {
    return workplace_id;
  }

  public void setWorkplace_id(Integer workplace_id) {
    this.workplace_id = workplace_id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  @Override
  public String toString() {
    return "FactoryDto{" +
        "factory_id=" + factory_id +
        ", workplace_id=" + workplace_id +
        ", name='" + name + '\'' +
        '}';
  }
}
