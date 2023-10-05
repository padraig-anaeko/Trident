#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app

EXPOSE 5000

ENV TRIDENT_CONNECTION_STRING=blah
ENV ASPNETCORE_URLS="http://+:5000"
ENV ASPNETCORE_ENVIRONMENT="Production"

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["Trident.Web/Trident.Web.csproj", "Trident.Web/"]
RUN dotnet restore "Trident.Web/Trident.Web.csproj"
COPY . .
WORKDIR "/src/Trident.Web"
RUN dotnet build "Trident.Web.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Trident.Web.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Trident.Web.dll"]