package com.classnet.dao;

import java.util.List;

import com.hyitclassnet.entities.StudentInfoEntities;

public interface StudentDao extends IHibernateSupportDao<StudentInfoEntities>{
  public boolean exportStuInfo(List<StudentInfoEntities> list);
}
