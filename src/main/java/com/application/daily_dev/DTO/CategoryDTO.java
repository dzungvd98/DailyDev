package com.application.daily_dev.DTO;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CategoryDTO {
    @NotBlank(message = "Category name is mandatory")
    private String name;

    @NotBlank(message = "Topic URL link is mandatory")
    private String topicUrl;

    @NotNull(message = "RSS source id is mandatory")
    private Integer rssSourceId;

}
