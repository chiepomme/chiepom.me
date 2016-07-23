require "webrick"

module Jekyll
  module Commands
    class Serve
      class Servlet < WEBrick::HTTPServlet::FileHandler
        # original: webrick/httpservlet/filehandler.rb
        def prevent_directory_traversal(req, res)
            # just change encoding "filesystem" to "utf-8"
            path = req.path_info.dup.force_encoding(Encoding.find("utf-8"))
            if trailing_pathsep?(req.path_info)
            expanded = File.expand_path(path + "x")
            expanded.chop!
            else
            expanded = File.expand_path(path)
            end
            expanded.force_encoding(req.path_info.encoding)
            req.path_info = expanded
        end
      end
    end
  end
end