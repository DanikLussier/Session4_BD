using Microsoft.EntityFrameworkCore;
using ProjetDeSession_2290726.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddDbContext<NespressoContext>(options =>
{
    options.UseSqlServer(builder.Configuration["ConnectionStrings:Nespresso"]);
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Capsules}/{action=IndexVue}"
);

app.MapRazorPages();

app.Run();
