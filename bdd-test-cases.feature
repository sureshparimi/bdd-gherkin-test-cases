
Feature: Upload media as a an IC user
              As an IC user, I should be able to upload media files in the valid format
              

        Scenario Outline: upload media in the Single dish section
              GIVEN the IC user on Media upload page 
              WHEN the user uploads a single <media_file> in the <section>
              THEN the uploaded file should be displayed in the <section> 
              AND A success message <success_message> should be displayed for <seconds> seconds
              AND the uploaded file name should match with the file name displayed
              AND user should be able to edit the file name
              AND count of the expected media should beincreased by 1

        Examples:
                  | media_file         | section          | success_message                        | seconds |
                  | /PATH/TO/file1.jpg | Single Dish      | 1 media has been successfully uploaded | 10      |
                  | /PATH/TO/file2.jpg | Dish composition | 2 medias successfully uploaded         | 10      |
                  | /PATH/TO/file3.jpg | Background       | 3 medias successfully up               | 10      |
                  | /PATH/TO/file1.png | Single Dish      | 1 media has been successfully uploaded | 10      |
                  | /PATH/TO/file2.png | Dish composition | 2 medias successfully uploaded         | 10      |
                  | /PATH/TO/file3.png | Background       | 3 medias successfully uploaded         | 10      |
     
              
        Scenario Outline:Maximum upload error message displayed
        """ When the user tries to upload more files than maximum allowed files, there should be an error displayed with message: Maximum upload reached """
            GIVEN Maximum files are uploaded in all the sections 
              AND the IC user on media upload page
            WHEN the user uploads a valid media file <section>
            THEN there should be an error message <error_message>
        
        Examples:
                  | section          | error_message          |
                  | Single Dish      | Maximum upload reached |
                  | Dish composition | Maximum upload reached |
                  | Background       | Maximum upload reached |


               
        Scenario Outline:Upload duplicate files
        """ When the user tries to upload duplicate files, there should be a message - File exists already"""
            GIVEN there is already a media file uploaded
              AND the IC user on media upload page
            WHEN the user uploads same file again in the <section>
            THEN there should be an error message <error_message>
        
        Examples:
                  | section          | error_message           |
                  | Single Dish      | Duplicate file uploaded |
                  | Dish composition | Duplicate file uploaded |


        Scenario Outline:Upload multiple valid file formats

              GIVEN the IC user on Media upload page 
              WHEN the user uploads a single <media_files> in the <section>
              THEN the uploaded files should be displayed in the <section> 
              AND the <file_size> to be displayed on the media file uploaded.
              AND A success message <success_message> should be displayed for <seconds> seconds

        Examples:
                  | media_files  | file_size | section          | success_message                        | seconds |
                  | file1.jpg    | 25.10 KB  | Single Dish      | 1 media has been successfully uploaded | 10      |
                  | file2.jpg    | 0.1 MB    | Dish composition | 2 medias successfully uploaded         | 10      |
                  | file3.jpg    | 990 .0 KB | Background       | 3 medias successfully up               | 10      |
                  | file1.png    | 1 KB      | Single Dish      | 1 media has been successfully uploaded | 10      |
                  | file2.png    | 1.5 GB    | Dish composition | 2 medias successfully uploaded         | 10      |
                  | file3.png    | 2 KB      | Background       | 3 medias successfully uploaded         | 10      |
                  | 619A0205.cr2 | 5 GB      | Single Dish      | 4 medias successfully uploaded         | 10      |
                  | 619A0205.crw | 10 B      | Single Dish      | 4 medias successfully uploaded         | 10      |
                  | 619A0205.cr3 | 4 GB      | Single Dish      | 4 medias successfully uploaded         | 10      |
              
              
        

        Scenario Outline: Prevent from uploading the incorrect media file formats

              GIVEN the IC user on Media upload page 
              WHEN the user uploads incorrect <media_file>
              THEN the <error_message> should be displayed
              AND the error message color should be orange

        Examples:
                  | media_files | error_message                                                    |
                  | file1.crx   | Wrong image format, only .jpg and .png file formats are accepted |
                  | file2.j0g   | Wrong image format, only .jpg and .png file formats are accepted |
                  | file1.mov   | Wrong image format, only .jpg and .png file formats are accepted |
                  | file2.mp4   | Wrong image format, only .jpg and .png file formats are accepted |

        Scenario Outline:User can edit the file name after upload
        GIVEN the IC user on the media upload page 
              AND the user successfully uploaded the media file
        WHEN user tried to edit the file name with <file_name>
        THEN the below file names should be treated as invalid file names with <error_message>

        Examples:
                  | file_name                                                             | error_message                          |
                  | <BLANK>                                                               | The file name is empty                 |
                  | file1.mp4                                                             | the file name extension is not allowed |
                  | file1.@suresh.parimi2@gmail.com with ocus interview Testing challenge | the file name is not valid             |
                  | @ $ % & \ / : * ? " ' < >                                             | the file name  is invlaid              |