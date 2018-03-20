package ru.astronarh.controller;

import ru.astronarh.dto.UserDTO;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;


public class Validators {

    public static List<String> emptyTest(@Valid UserDTO userDTO) {
        List<String> errorList = new ArrayList<>();
        if (userDTO.getLogin().equals("")) errorList.add("Username is empty");
        if (userDTO.getEmail().equals("")) errorList.add("Email is empty");
        if (userDTO.getPassword().equals("")) errorList.add("Password is empty");
        if (userDTO.getMatchingPassword().equals("")) errorList.add("Confirm password is empty");
        if (!userDTO.getMatchingPassword().equals(userDTO.getPassword())) errorList.add("Passwords do not match");
        if (!userDTO.getEmail().matches("^[a-zA-Z0-9]+@[a-zA-Z0-9]+(.[a-zA-Z]{2,})$")) errorList.add("Email is wrong");

        return errorList;
    }


}
