package com.hyitclassnet.dao;

import java.util.List;

import com.classnet.dao.IHibernateSupportDao;
import com.hyitclassnet.entities.StudentInfoEntities;

public interface StudentDao extends IHibernateSupportDao<StudentInfoEntities>{
  public boolean exportStuInfo(List<StudentInfoEntities> list);
}
