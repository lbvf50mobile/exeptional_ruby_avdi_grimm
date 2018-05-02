# Lising 50: Library-namespaced exceptions.

# immediately re-raise namespaces exceptions, otherwis they would
# be cause by the second, more generic rescue
begin
# ... 

rescue MyLibrary::Error
    raise
rescue => error
    # This assumes MyLibrary::Error supporst nesting:
    raise MyLibray::Error.new("#{error.class}: #{error.message}", error)

end
    