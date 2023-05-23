package domain;

import java.util.ArrayList;
import java.util.List;

public class Result<T> {
    private final ArrayList<String> messages = new ArrayList<>();
    private ResultType type = ResultType.SUCCESS;
    private T payload;
    public ResultType getType() { return type; }
    public boolean isSuccess() { return type == ResultType.SUCCESS; }
    public T getPayload() { return payload; }
    public void setPayload(T payload) { this.payload = payload; }
    public List<String> getMessages() { return new ArrayList<>(messages); }
    public void addMessages(String message, ResultType type) {
        messages.add(message);
        this.type = type;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Result<?> result)) return false;

        if (getMessages() != null ? !getMessages().equals(result.getMessages()) : result.getMessages() != null)
            return false;
        if (getType() != result.getType()) return false;
        return getPayload() != null ? getPayload().equals(result.getPayload()) : result.getPayload() == null;
    }

    @Override
    public int hashCode() {
        int result = getMessages() != null ? getMessages().hashCode() : 0;
        result = 31 * result + (getType() != null ? getType().hashCode() : 0);
        result = 31 * result + (getPayload() != null ? getPayload().hashCode() : 0);
        return result;
    }
}
