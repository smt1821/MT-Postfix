for id in $(postqueue -p | grep -B1 "example.com" | grep -Eo '^[0-9A-F]{10,}'); do
    echo "Flushing email with queue ID: $id"
    if postsuper -r $id; then
        echo "Successfully flushed $id"
    else
        echo "Failed to flush $id"
    fi
done
