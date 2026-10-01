package xiaozhi.modules.security.config;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.Instant;
import java.util.Date;
import java.util.Map;
import java.util.TimeZone;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.fasterxml.jackson.databind.ObjectMapper;

@DisplayName("Jackson 时区跟随 JVM 默认时区")
class WebMvcConfigTimeZoneTest {

    private TimeZone originalTimeZone;

    @BeforeEach
    void setUp() {
        originalTimeZone = TimeZone.getDefault();
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
    }

    @AfterEach
    void tearDown() {
        TimeZone.setDefault(originalTimeZone);
    }

    @Test
    @DisplayName("Date 按 JVM 默认时区（Asia/Ho_Chi_Minh）序列化与反序列化")
    void dateUsesJvmDefaultTimeZone() throws Exception {
        ObjectMapper objectMapper = new WebMvcConfig().jackson2HttpMessageConverter().getObjectMapper();
        Date createdAt = Date.from(Instant.parse("2026-07-10T13:21:42Z"));

        String json = objectMapper.writeValueAsString(Map.of("createdAt", createdAt));
        assertEquals("{\"createdAt\":\"2026-07-10 20:21:42\"}", json);

        Date parsed = objectMapper.readValue("\"2026-07-10 20:21:42\"", Date.class);
        assertEquals(createdAt, parsed);
    }
}
