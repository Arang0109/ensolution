package com.ensolution.manager.domain.stack;

public class ExDataStackMeasurementDto {
    private String stack_name;
    private String pollutant_name;
    private String prevention;
    private Integer allow_value;
    private String cycle_type;

    public ExDataStackMeasurementDto() {}

    public ExDataStackMeasurementDto(String stack_name, String pollutant_name, String prevention, Integer allow_value, String cycle_type) {
        this.stack_name = stack_name;
        this.pollutant_name = pollutant_name;
        this.prevention = prevention;
        this.allow_value = allow_value;
        this.cycle_type = cycle_type;
    }

    public String getStack_name() {
        return stack_name;
    }

    public void setStack_name(String stack_name) {
        this.stack_name = stack_name;
    }

    public String getPollutant_name() {
        return pollutant_name;
    }

    public void setPollutant_name(String pollutant_name) {
        this.pollutant_name = pollutant_name;
    }

    public String getPrevention() {
        return prevention;
    }

    public void setPrevention(String prevention) {
        this.prevention = prevention;
    }

    public Integer getAllow_value() {
        return allow_value;
    }

    public void setAllow_value(Integer allow_value) {
        this.allow_value = allow_value;
    }

    public String getCycle_type() {
        return cycle_type;
    }

    public void setCycle_type(String cycle_type) {
        this.cycle_type = cycle_type;
    }

    @Override
    public String toString() {
        return "exDataStackMeasurementDto{" +
                "stack_name='" + stack_name + '\'' +
                ", pollutant_name='" + pollutant_name + '\'' +
                ", prevention='" + prevention + '\'' +
                ", allow_value=" + allow_value +
                ", cycle_type='" + cycle_type + '\'' +
                '}';
    }
}
