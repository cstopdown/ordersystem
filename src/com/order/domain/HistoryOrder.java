package com.order.domain;

public class HistoryOrder {
    int h_id;
    String h_date;
    int h_sum;
    int h_state;
    String h_desc;
    String owner;

    public int getH_id() {
        return h_id;
    }

    public void setH_id(int h_id) {
        this.h_id = h_id;
    }

    public String getH_date() {
        return h_date;
    }

    public void setH_date(String h_date) {
        this.h_date = h_date;
    }

    public int getH_sum() {
        return h_sum;
    }

    public void setH_sum(int h_sum) {
        this.h_sum = h_sum;
    }

    public int getH_state() {
        return h_state;
    }

    public void setH_state(int h_state) {
        this.h_state = h_state;
    }

    public String getH_desc() {
        return h_desc;
    }

    public void setH_desc(String h_desc) {
        this.h_desc = h_desc;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    @Override
    public String toString() {
        return "HistoryOrder{" +
                "h_id=" + h_id +
                ", h_date='" + h_date + '\'' +
                ", h_sum=" + h_sum +
                ", h_state=" + h_state +
                ", h_desc='" + h_desc + '\'' +
                ", owner='" + owner + '\'' +
                '}';
    }
}
