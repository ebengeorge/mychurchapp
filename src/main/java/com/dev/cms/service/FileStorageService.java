package com.dev.cms.service;

import com.dev.cms.utils.FileUploadConfig;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class FileStorageService {

    private final String uploadDir;

    public FileStorageService(FileUploadConfig config) {
        this.uploadDir = config.getUploadDir();
    }

    public String saveImage(MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            throw new IOException("Failed to store empty file.");
        }
        if (!file.getContentType().startsWith("image/")) {
            throw new IOException("Invalid file type. Please upload an image.");
        }
        if (file.getSize() > 5 * 1024 * 1024) {  // 5MB limit
            throw new IOException("File size exceeds the limit of 5MB.");
        }

        // Generate a unique file name
        String originalFilename = file.getOriginalFilename();
        String extension = "";
        if (originalFilename != null && originalFilename.contains(".")) {
            extension = originalFilename.substring(originalFilename.lastIndexOf("."));
        }
        String fileName = System.currentTimeMillis() + extension;

        // Ensure the upload directory exists
        File destDir = new File(uploadDir);
        if (!destDir.exists()) {
            destDir.mkdirs();
        }

        // Save the file
        File dest = new File(destDir, fileName);
        file.transferTo(dest);

        return fileName; // Return the file name (or full URL/path as needed)
    }
}
