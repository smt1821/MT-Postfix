for id in $(postqueue -p | grep -B1 "noname@noname.com" | grep -Eo '^[0-9A-F]{10,}'); do
    postsuper -r $id
done
