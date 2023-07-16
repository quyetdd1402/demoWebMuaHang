package com.spring.entity;

import lombok.*;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.sql.Date;
import java.util.List;

@Entity
@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UsersKH implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank
    private String name;

    @NotBlank
    private String diaChi;

    @NotBlank
    @Pattern(regexp = "^0\\d{9,10}$",message = "{validation.phone.pattern}")
    private String phone;

    private Integer gioiTinh;

    @NotBlank
    private String username;

    private Date ngaySinh;

    @NotBlank
    @Pattern(regexp = "^\\d{9}$",message = "{validation.soCanCuoc.pattern}")
    private String soCanCuoc;

    private Integer trangThai;

    @NotBlank(message = "{validation.pasword.blank}")
    private String password;

}
