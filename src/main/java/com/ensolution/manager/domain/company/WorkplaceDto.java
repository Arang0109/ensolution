package com.ensolution.manager.domain.company;

import java.time.LocalDate;
import java.util.Date;
import java.util.Objects;

public class WorkplaceDto {
  private Integer workplace_id;
  private Integer company_id;
  private String workplace_name;
  private String address;
  private Date reg_date;

  public WorkplaceDto() {
    this.reg_date = java.sql.Date.valueOf(LocalDate.now());
  }

  public WorkplaceDto(Integer company_id, String workplace_name, String address) {
    this.company_id = company_id;
    this.workplace_name = workplace_name;
    this.address = address;
    this.reg_date = java.sql.Date.valueOf(LocalDate.now());
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    WorkplaceDto that = (WorkplaceDto) o;
    return Objects.equals(workplace_id, that.workplace_id) && Objects.equals(workplace_name, that.workplace_name);
  }

  @Override
  public int hashCode() {
    return Objects.hash(workplace_id, workplace_name);
  }

  public Date getReg_date() {
    return reg_date;
  }

  public void setReg_date(Date reg_date) {
    this.reg_date = reg_date;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getWorkplace_name() {
    return workplace_name;
  }

  public void setWorkplace_name(String workplace_name) {
    this.workplace_name = workplace_name;
  }

  public Integer getCompany_id() {
    return company_id;
  }

  public void setCompany_id(Integer company_id) {
    this.company_id = company_id;
  }

  public Integer getWorkplace_id() {
    return workplace_id;
  }

  public void setWorkplace_id(Integer workplace_id) {
    this.workplace_id = workplace_id;
  }

  @Override
  public String toString() {
    return "WorkplaceDto{" +
        "workplace_id=" + workplace_id +
        ", company_id=" + company_id +
        ", workplace_name='" + workplace_name + '\'' +
        ", address='" + address + '\'' +
        ", reg_date=" + reg_date +
        '}';
  }
}