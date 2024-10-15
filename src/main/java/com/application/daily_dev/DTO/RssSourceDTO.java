package com.application.daily_dev.DTO;

import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Builder;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Data;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RssSourceDTO {
    @NotBlank(message = "Source name is mandatory")
    @Size(max = 255, message = "Source name must be less than 255 characters")
    private String sourceName;

    @NotBlank(message = "RSS URL is mandatory")
    @Pattern(regexp = "^(http|https)://.*$", message = "Invalid RSS URL format")
    private String rssUrl;

    @NotBlank(message = "Website URL is mandatory")
    @Pattern(regexp = "^(http|https)://.*$", message = "Invalid Website URL format")
    private String websiteUrl;

    @NotBlank(message = "Content selector is mandatory")
    @Size(max = 100, message = "Content selector must be less than 100 characters")
    private String contentSelector;

}
