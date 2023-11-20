package com.example.studentkubernetesdemo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.logging.Logger;

@RestController
@RequestMapping("/student-records")
public class StudentController {

    @Autowired
    private StudentRepository studentRepository;

    private Logger logger = Logger.getLogger(StudentController.class.getName());

    @PostMapping("/student")
    public Student saveStudent(@RequestBody Student student){
        logger.info("Saving a new student");
        return studentRepository.save(student);
    }

    @GetMapping("/students")
    public List<Student> getStudents(){
        logger.info("Retrieving all students");
        return studentRepository.findAll();
    }

    @GetMapping("/students/{id}")
    public Optional<Student> getStudent(@PathVariable("id") Integer id){
        logger.info("Retrieving student by id");
        return studentRepository.findById(id);
    }

    @DeleteMapping("/student/delete/{id}")
    public void deleteStudent(@PathVariable("id") Integer id){
        logger.info("Deleting student by id");
        studentRepository.deleteById(id);
    }
}
