package com.spring.repository;

import com.spring.entity.UsersKH;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserKHRepository extends JpaRepository<UsersKH, Integer> {

    @Query(value = "SELECT * FROM userskh WHERE Username=?1 and Password=?2 and trang_thai=1", nativeQuery = true)
    UsersKH findAllByUsernameAndPassword(String username, String password);
}
