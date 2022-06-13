cat Directory.Build.props
dotnet clean -v minimal && rm -r **/bin **/obj
find . -name "*AssemblyInfo.cs" # There are no AssemblyInfo.cs files before building
dotnet build
find . -name "*AssemblyInfo.cs" # Each project has a generated AssemblyInfo.cs file at the configured IntermediateOutputPath
dotnet clean -v minimal && rm -r **/bin **/obj
dotnet stryker --log-to-file -tp TestProj -p MainProj
find . -name "*AssemblyInfo.cs" # In addition to the AssemblyInfo.cs files at the configured IntermediateOutputPath, there is a duplicate AssemblyInfo.cs file at the same relative path under the project directory
