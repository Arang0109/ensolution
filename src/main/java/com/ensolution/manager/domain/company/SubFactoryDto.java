package com.ensolution.manager.domain.company;

public class SubFactoryDto {
  private Integer sub_factory_id;
  private Integer factory_id;
  private String name;

  public SubFactoryDto() {};

  public SubFactoryDto(Integer sub_factory_id, Integer factory_id, String name) {
    this.sub_factory_id = sub_factory_id;
    this.factory_id = factory_id;
    this.name = name;
  }

  public Integer getSub_factory_id() {
    return sub_factory_id;
  }

  public void setSub_factory_id(Integer sub_factory_id) {
    this.sub_factory_id = sub_factory_id;
  }

  public Integer getFactory_id() {
    return factory_id;
  }

  public void setFactory_id(Integer factory_id) {
    this.factory_id = factory_id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  @Override
  public String toString() {
    return "SubFactoryDto{" +
        "sub_factory_id=" + sub_factory_id +
        ", factory_id=" + factory_id +
        ", name='" + name + '\'' +
        '}';
  }
}
