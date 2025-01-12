# Use the official .NET Core SDK image
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

# Use the .NET Core SDK image for building the app
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src

# Copy the project file and restore any dependencies (via 'dotnet restore')
COPY ["DotNetCoreApp/DotNetCoreApp.csproj", "DotNetCoreApp/"]
RUN dotnet restore "DotNetCoreApp/DotNetCoreApp.csproj"

# Copy the rest of the files and build the app
COPY . .
WORKDIR "/src/DotNetCoreApp"
RUN dotnet build "DotNetCoreApp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "DotNetCoreApp.csproj" -c Release -o /app/publish

# Copy the published app to the base image
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "DotNetCoreApp.dll"]
