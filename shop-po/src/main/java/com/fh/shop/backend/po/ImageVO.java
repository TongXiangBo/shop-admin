package com.fh.shop.backend.po;

import java.io.Serializable;

public class ImageVO implements Serializable {
    private static final long serialVersionUID = 3285997995380501162L;
    private int id;
    private String productImagePath;

    private Integer productId;

    @Override
    public String toString() {
        return "ImageVO{" +
                "id=" + id +
                ", productImagePath='" + productImagePath + '\'' +
                ", productId=" + productId +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductImagePath() {
        return productImagePath;
    }

    public void setProductImagePath(String productImagePath) {
        this.productImagePath = productImagePath;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }
}
