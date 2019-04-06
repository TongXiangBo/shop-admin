package com.fh.shop.backend.po;

import java.io.Serializable;

public class BrandImage implements Serializable {
    private static final long serialVersionUID = 442159602593433105L;

    private  Integer id;
    private  String  brandImagePath;
    private  Integer brandIamgeId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBrandImagePath() {
        return brandImagePath;
    }

    public void setBrandImagePath(String brandImagePath) {
        this.brandImagePath = brandImagePath;
    }

    public Integer getBrandIamgeId() {
        return brandIamgeId;
    }

    @Override
    public String toString() {
        return "BrandImage{" +
                "id=" + id +
                ", brandImagePath='" + brandImagePath + '\'' +
                ", brandIamgeId=" + brandIamgeId +
                '}';
    }

    public void setBrandIamgeId(Integer brandIamgeId) {
        this.brandIamgeId = brandIamgeId;
    }
}
